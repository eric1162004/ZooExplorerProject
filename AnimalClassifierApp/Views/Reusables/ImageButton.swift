//
//  ImageButton.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct ImageButton: View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.primaryColor)
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton()
    }
}
