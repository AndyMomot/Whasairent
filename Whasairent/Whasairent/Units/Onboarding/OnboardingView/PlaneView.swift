//
//  PlaneView.swift
//  Whasairent
//
//  Created by Andrii Momot on 20.07.2024.
//

import SwiftUI

struct PlaneView: View {
    var item: OnboardingView.OnboardingItem
    
    var body: some View {
        ZStack {
            Asset.sky.swiftUIImage
                .resizable()
                .scaledToFit()
            
            Asset.ellipse.swiftUIImage
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(item.elipsRotationDegrees))
            
            Image(item.imageName)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    ZStack {
        Colors.greenCustom.swiftUIColor
        
        PlaneView(item: .second)
    }
}
