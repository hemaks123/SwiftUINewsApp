//
//  View+Extensions.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI
import UIKit

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
    
    func hideTabbar() -> some View {
        return self.modifier(HideTabbar())
    }
    
    func showTabBar() -> some View {
        return self.modifier(ShowTabBar())
    }
}
