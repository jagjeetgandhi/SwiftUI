//
//  ContentView.swift
//  FirstUI
//
//  Created by jagjeet on 10/07/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("profile").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 350).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white , lineWidth: 3))
                Text("JAGJEET GANDHI")
                    .font(Font.custom("Pacifico-Regular", size:40))
                    .foregroundColor(.white)
                Text("IOS Developer")
                .font(Font.custom("Pacifico-Regular", size:32))
                    .foregroundColor(.white)
                Divider()
                ContactInfo(icon: "phone.fill", phno: "123456789")
                ContactInfo(icon: "envelope.fill", phno: "gandhi.jagjeet@.com")
                Button("button") {
                               print("button tapped")
                           }
               
    
                }
            
            }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11")
    }
}


