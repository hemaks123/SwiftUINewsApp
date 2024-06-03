//
//  BaseViewStates.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation
 
protocol ViewStateProtocol {
    static var ready: Self { get }
}

protocol ViewStatable {
    associatedtype ViewState: ViewStatable = DefaultViewState
}

enum DefaultViewState: ViewStateProtocol {
    case ready
}
