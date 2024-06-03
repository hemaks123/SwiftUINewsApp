//
//  SelectedDiscoverView.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI

struct SelectedDiscoverView: View {
    @StateObject private var viewModel: SelectedDiscoverViewModel
    
    var body: some View {
        baseView()
            .navigationTitle(viewModel.category.title.capitalized)
    }
    
    init(category: NewsCategories,
         service: NewsServiceable) {
        self._viewModel = StateObject(wrappedValue: SelectedDiscoverViewModel(category: category,
                                                                              service: service))
    }
    
    @ViewBuilder
    private func baseView() -> some View {
        switch viewModel.states {
        case .finished:
            NewsListView(news: viewModel.news)
            .hideTabbar()
        case .loading:
            ProgressView("Loading")
        case .error(error: let error):
            CustomStateView(image: "exclamationmark.transmission",
                            description: "Something get wrong !",
                            tintColor: .red)
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Error Message"),
                      message: Text(error),
                      dismissButton: Alert.Button.default(
                        Text("Ok"), action: {
                            viewModel.changeStateToEmpty()
                        }
                      ))
            }
        case .ready:
            ProgressView()
                .onAppear {
                    viewModel.serviceInitialize()
                }
        case .empty:
            CustomStateView(image: "newspaper",
                            description: "There is no data :(",
                            tintColor: .indigo)
        }
    }
}

struct SelectedDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedDiscoverView(category: .technology,
                             service: NewsService())
    }
}
