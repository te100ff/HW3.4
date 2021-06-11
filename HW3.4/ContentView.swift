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
    @State private var alpha = 1.0
    @State private var vvv = ""
    
    var body: some View {
        VStack {
            Text("Move you're slider maximum closer to: \(targetValue)")
            HStack {
                Text("0")
                ValueSlider(alpha: $alpha, currentValue: $currentValue)
                Text("100")
            }
            Text("Slider value: \(vvv)")
                .onChange(of: currentValue, perform: { value in
                    vvv = String(value)
                })
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
