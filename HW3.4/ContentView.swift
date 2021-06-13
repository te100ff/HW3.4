//
//  ContentView.swift
//  HW3.4
//
//  Created by Stanislav Testov on 10.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var alertPresented = false
    private var alpha: Double { Double(computeScore())/100 }
    
    
    var body: some View {
        VStack {
            Text("Move you're slider as close to: \(targetValue)")
            HStack {
                Text("0")
                ValueSlider(currentValue: $currentValue, alpha: alpha)
                Text("100")
            }
            
            Button("Check result") {
                alertPresented.toggle()
            }
            .alert(isPresented: $alertPresented) {
                Alert(title: Text("You're score"), message: Text("\(computeScore())"))
            }
            .padding()
            
            Button("New game") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
        
    }
    
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
