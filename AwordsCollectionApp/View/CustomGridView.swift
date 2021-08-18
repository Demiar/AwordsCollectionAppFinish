//
//  GridView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 04.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content: View {
    let items: [T]
    let columns: Int
    let content: (T) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideSize = geometry.size.width / CGFloat(columns)
            ScrollView {
                LazyVStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        LazyHStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = elementRow(row: rowIndex, column: columnIndex) {
                                    content(items[index])
                                        .frame(width: sideSize, height: sideSize)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func elementRow(row: Int, column: Int) -> Int?  {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: Array(1...100), columns: 3) { item in
            Text("\(item)")
        }
    }
}
