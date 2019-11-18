//
//  BlurView.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct BlureView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlureView>) -> UIView {
        let blureEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blureEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlureView>) {
    }
}

struct BlureView_Previews: PreviewProvider {
    static var previews: some View {
        BlureView(style: .dark)
    }
}
