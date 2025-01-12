//
//  TabItemView.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI

struct TabItemView<Content: View>: View {
    let menuItem:MenuItemType
    let content: Content
    
    init(_ menuItem :MenuItemType,
         @ViewBuilder content: () -> Content) {
        self.content = content()
        self.menuItem = menuItem
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle(menuItem.title)
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .tabItem {
            Image(systemName: menuItem.imageName).renderingMode(.template)
        }
        .tag(menuItem)
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(MenuItemType.search) {
            HomeView(service: NewsService())
        }
    }
}
