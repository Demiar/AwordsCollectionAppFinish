//
//  ShapesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ShapesView: View {
    let awards = Award.getAwards()
    let columns: Int = 2
    
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let sideSize = geometry.size.width / CGFloat(columns)
                ScrollView {
                    GridView(items: activeAwards, columns: columns, content: { award in
                        VStack{
                            award.awardView
                            Text(award.title)
                        }
                        .padding()
                        .frame(width: sideSize, height: sideSize)
                        
                    })
                    .navigationBarTitle("Your awards: \(activeAwards.count)")
                }
            }
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
