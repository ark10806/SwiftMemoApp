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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
