//
//  NewsListView.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI

struct NewsListView: View {
    let news:[Article]
    @State var isloading = false
    
    var body: some View {
        StaggeredGrid(list: news,
                      columns: 2,
                      showsIndicator: false,
                      spacing: 12) { news in
            NavigationLink {
                WebView(url: news.url ?? "", showLoading: $isloading)
                    .overlay(isloading ? ProgressView("Loading").toAnyView() : EmptyView().toAnyView())
                    .navigationTitle(news.source?.name ?? "")
                    .hideTabbar()
                    .ignoresSafeArea()
                
            } label: {
                NewsCell(item: NewsCellItem(imageUrl: news.urlToImage ?? "",
                                            owner: news.source?.name ?? "",
                                            title: news.title ?? "",
                                            date: news.publishedAt?.calculateTime() ?? ""))
            }
        }
    }
}
