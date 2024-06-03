//
//  DiscoveryViewModel.swift
//  DunbleNews
//
//  Created by Hema K S on 02/06/2024.
//

import Foundation

final class DiscoverViewModel: BaseViewModel<DiscoveryViewStates> {
    
    let service: NewsServiceable
    var defaultCategory: NewsCategories
    var allCategories: NewsCategories.AllCases
    
    init(service: NewsServiceable) {
        self.defaultCategory = NewsCategories.general
        self.allCategories = NewsCategories.allCases.filter { $0.title != NewsCategories.allCases.first?.title }
        self.service = service
    }
}


