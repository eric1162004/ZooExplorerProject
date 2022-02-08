//
//  CapsuleButton.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct CapsuleButton: View {
    let label: String
    var backgroundColor: Color = .green
    var fontSize: CGFloat = FontSize.medium
    var handlePressed: (() -> Void)?
    
    var body: some View {
        
        if let handlePressed = handlePressed {
            Button(action: {
                handlePressed()
            }){
                Text(label)
                    .frame(maxWidth: .infinity, minHeight: Dm.medium, alignment: .center)
                    .padding()
                    .background(backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(CornerRadius.xlarge)
            }
        }
        else {
            Text(label)
                .frame(maxWidth: .infinity, minHeight: Dm.medium, alignment: .center)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(CornerRadius.xlarge)
        }
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(label: "Click me"){
            print("pressed")
        }
    }
}
