//
//  SelectedDiscoverViewStates.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation

enum SelectedDiscoverViewStates: ViewStateProtocol {
    case ready
    case loading
    case finished
    case error(error: String)
    case empty
}

extension SelectedDiscoverViewStates: Equatable {}
