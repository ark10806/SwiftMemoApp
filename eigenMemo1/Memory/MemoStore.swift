//
//  MemoStore.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/24.
//

import Foundation

// ObservableObject: 메모를 편집 시 view를 자동으로 업데이트하기 위해 사용
class MemoStore: ObservableObject {
    @Published var list: [Memo] // 퍼블리시 특성으로 선언하면 배열을 업데이트할때마다 뷰도 자동 업데이트
    
    init() {
        list = [
            Memo(content: "hello", insertDate: Date.now),
            Memo(content: "world", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "eigen", insertDate: Date.now.addingTimeInterval(3600 * -48)),
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
