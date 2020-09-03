//
//  ContentView.swift
//  BetterRest
//
//  Created by jagjeet on 17/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI
import  CoreML
struct ContentView: View {
    @State private var coffe:Int = 1
    @State private var sleep:Double = 8.0
    @State private var wakeup = defaultWakeTime
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
  func claculateBedTime() {
      let model = SleepCalculator()
    
    let components = Calendar.current.dateComponents([.hour,.minute], from: wakeup)
    let hours = (components.hour ?? 0) * 60 * 60
    let minute = (components.minute ?? 0) * 60
    do {
        let prediction = try model.prediction(wake: Double(hours + minute), estimatedSleep: sleep, coffee: Double(coffe))
        let sleeptime = wakeup - prediction.actualSleep
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let date = formatter.string(from: sleeptime)
         alertTitle = "Sleep Time"
        alertMessage = "Go to bed at \(date) "
         showingAlert = true
        
    }catch {
        
        alertTitle = "Error"
        alertMessage = " Enter the correct Values "
         showingAlert = true
    }
    
  }
   static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    var calculate: some View {
        
        Button(action:claculateBedTime) {
            Text("Calculate")
        }
    }
    
    var body: some View {
        NavigationView {
        Form{
            Text("When do you want to wake up?")
            .font(.headline)
            DatePicker("Select Date",selection: $wakeup,displayedComponents: .hourAndMinute)
                .labelsHidden()
            Text("Desired amount of sleep")
            .font(.headline)
            Stepper(value: $sleep, in: 2...12) {
                Text("\(sleep,specifier:"%g") Hours")
        
        }
            Text("Daily coffee intake")
            .font(.headline)
            Stepper(value:$coffe,in: 1...20) {
                if coffe == 1 {
                    Text("\(coffe) cup")
                }
                else {
                    Text("\(coffe) cups")
                }
            }
           
            
        }
        
            .navigationBarItems(trailing: calculate)
        .navigationBarTitle(Text("Sleep Calulator"))
        }
        .alert(isPresented: $showingAlert){
            Alert(title: Text("\(alertTitle)"), message: Text("\(alertMessage)"), dismissButton:.default(Text("ok")))
        }
    
        
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct textField:ViewModifier {
      func body(content: Content) -> some View {
          return content
            .padding(.top,10)
            .padding(.bottom,10)
      }
  }
