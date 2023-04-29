//
//  Memo.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/24.
//

import Foundation
import SwiftUI

// Identifiable: 데이터를 리스트에 바인딩하기 위해 사용
// ObservableObject: 메모를 편집 시 view를 자동으로 업데이트하기 위해 사용
class Memo: Identifiable, ObservableObject {
    let id: UUID
    // Published: 값 변경 시에 view 자동 업데이트
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
