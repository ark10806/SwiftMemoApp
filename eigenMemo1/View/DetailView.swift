//
//  DetailView.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/29.
//

import SwiftUI

struct DetailView: View {
    // Published 로 선언 content 속성이 바뀔때마다 view가 업데이트됨
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        VStack {
            ScrollView{
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                }
            }
        }
        .navigationTitle("메모 보기")
        .toolbar {
            ToolbarItemGroup {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        memo.content = ""
//                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제할까요?")
                }
                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
