//
//  TabbarView.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI

struct TabbarView: View {
    @State var menuItemType: MenuItemType = .discover
    private let service: NewsServiceable
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: Colors.tabbarTextColor ?? .red]
        navBarAppearance.titleTextAttributes = [.foregroundColor:  Colors.tabbarTextColor ?? .red]
        self.service = NewsService()
    }
    
    var body: some View {
        TabView(selection: $menuItemType) {
            TabItemView(MenuItemType.home) {
                HomeView(service: service)
            }
            TabItemView(MenuItemType.discover) {
                DiscoverView(service: service)
            }
            TabItemView(MenuItemType.search) {
                SearchView(service: service)
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
