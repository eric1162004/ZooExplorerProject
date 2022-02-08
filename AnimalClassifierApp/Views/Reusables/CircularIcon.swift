//
//  CircularIcon.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-08.
//

import SwiftUI

struct CircularIcon: View {
    
    var iconName: String
    var iconSize: CGFloat = 20
    
    var body: some View {
        Image(systemName: iconName)
            .resizable()
            .scaledToFit()
            .frame(width: iconSize, height: iconSize)
            .padding()
            .foregroundColor(.white)
            .background(Color.primaryColor)
            .clipShape(Circle())
            .offset(x: Dm.small, y: -Dm.small)
    }
}

struct CircularIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircularIcon(iconName: "arrow.left.arrow.right")
    }
}
