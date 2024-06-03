//
//  HomeViewStates.swift
//  DunbleNews
//
//  Created by Hema K S on 02/06/2024.
//

import Foundation

enum HomeViewStates: ViewStateProtocol {
    case ready
    case loading
    case finished
    case error(error: String)
    case empty
}

extension HomeViewStates: Equatable {}
