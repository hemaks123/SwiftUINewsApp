//
//  Categories.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation

enum NewsCategories: CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    
    var title: String {
        switch self {
        case .general:
            return "General"
        case .entertainment:
            return "Entertainment"
        case .business:
            return "Business"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
        }
    }
    
    var imageName:String {
        switch self {
        case .business:
            return "bs"
        case .entertainment:
            return "ent"
        case .general:
            return "gen"
        case .health:
            return "he"
        case .science:
            return "sci"
        case .sports:
            return "spr"
        case .technology:
            return "tec"
        }
    }
}

extension NewsCategories: Identifiable {
    var id: UUID {
        return UUID()
    }
}

enum Countries {
    case tr
    case us
    case de
    case fr
    case gb
    case gr
    case ru
    
    var code : String {
        switch self {
        case .tr:
            return "tr"
        case .us:
            return "us"
        case .de:
            return "de"
        case .fr:
            return "fr"
        case .gb:
            return "gb"
        case .gr:
            return "gr"
        case .ru:
            return "ru"
        }
    }
}

enum MenuItemType {
    case home
    case search
    case discover
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .discover:
            return "Discover"
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .discover:
            return "safari"
        }
    }
}
