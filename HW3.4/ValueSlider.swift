//
//  ValueSlider.swift
//  HW3.4
//
//  Created by Stanislav Testov on 10.06.2021.
//

import SwiftUI

struct ValueSlider: UIViewRepresentable {
    
    @Binding var alpha: Double
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.thumbTintColor = .red
        slider.value = 20
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didTapDone),
            for: .allTouchEvents)
        
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.alpha = CGFloat(alpha)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(alpha: $alpha, currentValue: $currentValue)
    }
    
    
}

extension ValueSlider {
    class  Coordinator: NSObject {
        @Binding var alpha: Double
        @Binding var currentValue: Double
        
        init(alpha: Binding<Double>, currentValue: Binding<Double>) {
            self._alpha = alpha
            self._currentValue = currentValue
        }
        
        @objc func didTapDone(_ sender: UISlider) {
            alpha = Double(sender.alpha)
            currentValue = Double(sender.value)
        }
    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View {
        ValueSlider(alpha: .constant(0.8), currentValue: .constant(50.0))
    }

    
    
}
