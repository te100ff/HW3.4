//
//  ValueSlider.swift
//  HW3.4
//
//  Created by Stanislav Testov on 10.06.2021.
//

import SwiftUI

struct ValueSlider: UIViewRepresentable {
    
    @Binding var alpha: Double
    @Binding var value: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.alpha = CGFloat(alpha)
        slider.value = Float(value)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.alpha = CGFloat(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(alpha: $alpha, value: $value)
    }
    
    
}

extension ValueSlider {
    class  Coordinator: NSObject {
        @Binding var alpha: Double
        @Binding var value: Int
        
        init(alpha: Binding<Double>, value: Binding<Int>) {
            self._alpha = alpha
            self._value = value
        }
    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View {
        ValueSlider(alpha: .constant(0.8), value: .constant(50))
    }

    
    
}
