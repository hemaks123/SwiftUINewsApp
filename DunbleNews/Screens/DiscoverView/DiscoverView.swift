//
//  DiscoverView.swift
//  DunbleNews
//
//  Created by Hema K S on 02/06/2024.
//

import SwiftUI

struct DiscoverView: View {
    @ObservedObject private var viewModel: DiscoverViewModel
    
    init(service: NewsServiceable) {
        self._viewModel = ObservedObject(wrappedValue: DiscoverViewModel(service: service))
    }
    
    var body: some View {
        baseView()
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.states {
        case .ready:
            GeometryReader { geo in
                VStack(spacing: 12) {
                    defaulCategory(geo: geo)
                    categories(geo: geo)
                }
                .showTabBar()
            }
        }
    }
    
    @ViewBuilder
    private func defaulCategory(geo: GeometryProxy) -> some View {
        NavigationLink(destination: SelectedDiscoverView(category: viewModel.defaultCategory,
                                                         service: viewModel.service)) {
            CategoriesCell(image:"star",
                           title: viewModel.defaultCategory.title)
            .frame(height: geo.size.height / 4)
            .padding(.horizontal, 12)
        }
    }
    
    @ViewBuilder
    private func categories(geo: GeometryProxy) -> some View {
        StaggeredGrid(list: viewModel.allCategories,
                      columns: 2,
                      showsIndicator:false,
                      spacing: 12) { category in
            NavigationLink(destination: SelectedDiscoverView(category: category,
                                                             service: viewModel.service)) {
                CategoriesCell(image: category.imageName, title: category.title)
                    .frame(height: geo.size.height / 5)
                    .padding(.horizontal, 12)
            }
        }
                      .padding(.bottom, 2)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(service: NewsService())
    }
}
