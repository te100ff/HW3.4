//
//  ValueSlider.swift
//  HW3.4
//
//  Created by Stanislav Testov on 10.06.2021.
//

import SwiftUI

struct ValueSlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
               
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanging),
            for: .valueChanged)
    
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0.1, blue: 0.1, alpha: CGFloat(alpha))
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
        
}

extension ValueSlider {
    class  Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueChanging(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View {
        ValueSlider(currentValue: .constant(50.0), alpha: 1)
    }

    
    
}
