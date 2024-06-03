//
//  Date+Extension.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import Foundation

extension Date {
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}
