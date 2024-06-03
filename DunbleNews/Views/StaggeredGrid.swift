//
//  StaggeredGrid.swift
//  DunbleNews
//
//  Created by Hema K S on 01/06/2024.
//

import SwiftUI

struct StaggeredGrid<Content: View,T:Hashable>: View{
    
    var content:(T) -> Content
    var list: [T]
    var columns: Int
    var showsIndicator: Bool
    var spacing: CGFloat
    
    init(list: [T],
         columns: Int,
         showsIndicator: Bool,
         spacing: CGFloat,
         content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.columns = columns
        self.showsIndicator = showsIndicator
        self.spacing = spacing
    }
    
    var body: some View {
       objectList()
    }
    
    private func setUpList() -> [[T]] {
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        var currentIndex = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    @ViewBuilder
    private func objectList() -> some View {
        ScrollView(.vertical, showsIndicators: showsIndicator) {
            HStack(alignment: .top, spacing: -12) {
                ForEach(setUpList(), id: \.self) { columsData in
                    LazyVStack(spacing: spacing) {
                        ForEach(columsData, id: \.self) { object in
                            content(object)
                        }
                    }
                }
            }
        }
    }
}
