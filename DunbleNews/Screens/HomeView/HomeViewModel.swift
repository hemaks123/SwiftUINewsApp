//
//  HomeViewModel.swift
//  DunbleNews
//
//  Created by Hema K S on 02/06/2024.
//

import Foundation

final class HomeViewModel: BaseViewModel<HomeViewStates> {
    let service: NewsServiceable
    var showingAlert: Bool
    
    @Published private(set) var allNews: [Article]
    
    init(service: NewsServiceable) {
        self.service = service
        self.allNews = []
        self.showingAlert = false
    }
    
    func serviceInitialize() {
        fetchNews()
    }
    
    func changeStateToEmpty() {
        changeState(.empty)
    }
    
    private func fetchNews() {
        changeState(.loading)
        Task { [weak self] in
            guard let self = self else { return }
            let result = await self.service.fetchAllNews(country: .us)
            self.changeState(.finished)
            switch result {
            case .success(let success):
                guard let articles = success.articles else { return }
                DispatchQueue.main.async {
                    self.allNews = articles
                }
            case .failure(let failure):
                self.changeState(.error(error: failure.customMessage))
                self.showingAlert.toggle()
            }
        }
    }
}
