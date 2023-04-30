//
//  MainListView.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/24.
//

import SwiftUI

struct MainListView: View {
    // eigenMemo1App 에서 MemoStore를 StateObject로 등록했었다.
    // 아래의 store의 생성 시점에 공유데이터에 MemoStore가 존재한다면 그걸 사용.
    // 즉, static 변수로 사용하는 것.
    @EnvironmentObject var store: MemoStore
    @ObservedObject var clip: Clipboard
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)    // ExtractSubView 로 view를 분리, 가독성 높임
                    }
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")    // modifier라고 부르는 특별한 메서드로 속성을 바꾸거나 view를 조작.
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        HStack {
            Text(clip.content)
            Button {
                clip.startPolling()
            } label: {
                Image(systemName: "star.circle")
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView(clip: Clipboard())
            .environmentObject(MemoStore())
    }
}
