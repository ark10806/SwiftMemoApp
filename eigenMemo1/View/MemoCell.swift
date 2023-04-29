//
//  MemoCell.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/29.
//

import SwiftUI

struct MemoCell: View {
    // memo 업데이트 시마다 view 도 업데이트
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
    }
}
