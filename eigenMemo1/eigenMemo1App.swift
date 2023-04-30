//
//  eigenMemo1App.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/22.
//

import SwiftUI

@main
struct eigenMemo1App: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView(clip: Clipboard())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)   // MainListView와 이어지는 view에서 동일한 객체에 접근 가능.
        }
    }
}
