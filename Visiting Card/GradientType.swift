//
//  GradientType.swift
//  FirstUI
//
//  Created by jagjeet on 13/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct GradientType: View {
    var body: some View {
        ZStack {
  //  LinearGradient(gradient: Gradient(colors:[.blue , .white,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
        //RadialGradient(gradient: Gradient(colors: [.blue,.white,.pink,.yellow]), center: .topLeading, startRadius: 20, endRadius: 800)
           // AngularGradient(gradient: Gradient(colors: [.green,.blue,.black,.green,.blue,.black,.green]), center: .center)
            //    .edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("Hello World")
                .padding()
                .background(Color.red)
                .padding(.all)
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.yellow)
                
            }
    }
    }
}

struct GradientType_Previews: PreviewProvider {
    static var previews: some View {
        GradientType()
    }
}
