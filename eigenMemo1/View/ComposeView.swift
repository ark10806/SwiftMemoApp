//
//  ComposeView.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/29.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil   // ?는 optional. memo가 nil 이 아니면 편집모드, nil 이면 새로운 메모
    
    @Environment(\.dismiss) var dismiss
    
    // State variable이라고 부른다. 입력한 텍스트를 바인딩하기 위함
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // private var content와 바인딩. 입력한 값이 연동됨.
                // two-way binding: 반대로 content 문자열이 TextEditor에도 연동된다.
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .toolbar {
                ToolbarItemGroup() {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup() {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
