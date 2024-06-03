//
//  UIView+Extension.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation
import UIKit

extension UIView {
    func allSubviews() -> [UIView] {
        var res = self.subviews
        for subview in self.subviews {
            let riz = subview.allSubviews()
            res.append(contentsOf: riz)
        }
        return res
    }
}
