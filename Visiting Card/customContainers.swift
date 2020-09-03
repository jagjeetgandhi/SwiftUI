//
//  customContainers.swift
//  FirstUI
//
//  Created by jagjeet on 17/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct customContainers: View {
    @State var wakeup = Date()
    
    var body: some View {
    GridStack(rows: 4, columns: 4) { row, col in
        
        VStack{
            Image("deep").resizable()
            .frame(width: 100, height: 100)
            .clipped()
            Image(systemName: "\(row * 4 + col).circle")
          Text("R\(row) C\(col)")
            
            
        }
        
        }
    
    }
}

struct customContainers_Previews: PreviewProvider {
    static var previews: some View {
        customContainers()
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
               ForEach(0..<rows, id: \.self) { row in
                   HStack {
                       ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                       }
                   }
               }
           }
    }
}
