//
//  SearchViewModel.swift
//  DunbleNews
//
//  Created by Hema K S on 02/06/2024.
//

import Foundation

final class SearchViewModel: BaseViewModel<SearchViewStates> {
    private let service: NewsServiceable
    var showingAlert: Bool
    
    @Published var searchQuery: String
    @Published private(set) var news: [Article]
   
    init(service: NewsServiceable) {
        self.service = service
        self.news = []
        self.showingAlert = false
        self.searchQuery = ""
    }
    
    func checkValidation() {
        if searchQuery.isValid() {
            changeState(.error(error: "Search string not valid"))
            self.showingAlert.toggle()
        } else {
            fetchNews()
        }
    }
    
    func changeStateToEmpty() {
        news = []
        changeState(.empty)
    }
    
    private func fetchNews() {
        changeState(.loading)
        Task { [weak self] in
            guard let self = self else { return }
            let result = await self.service.fetchSearchedNews(query: searchQuery)
            self.changeState(.finished)
            switch result {
            case .success(let success):
                guard let articles = success.articles else { return }
                DispatchQueue.main.async {
                    self.news = articles
                    if articles.count < 1 {
                        self.changeState(.empty)
                    }
                }
            case .failure(let failure):
                self.changeState(.error(error: failure.customMessage))
                self.showingAlert.toggle()
            }
        }
    }
}
