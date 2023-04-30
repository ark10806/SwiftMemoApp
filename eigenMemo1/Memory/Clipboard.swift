//
//  Clipboard.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/30.
//

import Foundation

import SwiftUI

// Identifiable: 데이터를 리스트에 바인딩하기 위해 사용
// ObservableObject: 메모를 편집 시 view를 자동으로 업데이트하기 위해 사용
class Clipboard: ObservableObject {
    @Published var content: String
    
    let pboard = NSPasteboard.general
    
    init() {
        self.content = NSPasteboard.general.string(forType: .string) ?? "no data"
//        let cb = NSPasteboard.general.string(forType: .string)
    }
    
    func startPolling() {
        let timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        self.content = NSPasteboard.general.string(forType: .string) ?? "no data"
    }
}
