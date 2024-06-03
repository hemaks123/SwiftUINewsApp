//
//  Services.swift
//  DunbleNews
//
//  Created by Hema K S on 31/05/2024.
//

import Foundation
import SwiftUI

protocol NewsServiceable {
    func fetchAllNews(country: Countries) async -> Result<ServiceModel, RequestError>
    func fetchSearchedNews(query: String) async -> Result<ServiceModel, RequestError>
    func fetchNewsByCategory(country: Countries, category: String) async -> Result<ServiceModel, RequestError>
}

struct NewsService: HTTPClient, NewsServiceable {
    
    func fetchNewsByCategory(country: Countries, category: String) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endpoint: NewsEndpoint.newsByCategory(category: category, country: country), responseModel: ServiceModel.self)
    }
    
    func fetchSearchedNews(query: String) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endpoint: NewsEndpoint.searchNews(query: query), responseModel: ServiceModel.self)
    }
    
    func fetchAllNews(country: Countries) async -> Result<ServiceModel, RequestError> {
        return await sendRequest(endpoint: NewsEndpoint.allNews(country: country), responseModel: ServiceModel.self)
    }
}
