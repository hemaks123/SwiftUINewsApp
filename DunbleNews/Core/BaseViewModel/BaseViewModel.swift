//
//  BaseViewModel.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation

class BaseViewModel<E: ViewStateProtocol>: ObservableObject {
    @Published var states: E = .ready
    
    func changeState(_ state: E) {
        DispatchQueue.main.async { [weak self] in
            self?.states = state
            debugPrint("State changed to \(state)")
        }
    }
}
