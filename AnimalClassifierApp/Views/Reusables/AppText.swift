//
//  AppText.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct AppText: View {
    
    var text: String
    var font: String = Fonts.rowdies_regular
    var fontSize: CGFloat = 20
    var fontColor: Color = .black
    
    var body: some View {
        Text(text)
            .font(.custom(font, size: fontSize))
            .foregroundColor(fontColor)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct AppText_Previews: PreviewProvider {
    static var previews: some View {
        AppText(text: "Hello World")
    }
}
