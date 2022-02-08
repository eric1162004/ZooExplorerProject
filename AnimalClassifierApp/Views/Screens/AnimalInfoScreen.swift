//
//  AnimalInfoScreen.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct AnimalInfoScreen: View {
    
    @Environment(\.presentationMode) var presentation
    
    var animal: Animal
    
    var body: some View {
        ZStack{
            
            Color.backgroundColor
            
            VStack{
                // Top bar
                TopBar(title: "Wikipedia", leadingIcon: "chevron.left", trailingIcon: "", leadingIconHandler: {
                    self.presentation.wrappedValue.dismiss()
                })
                
                AnimalContent(animal: animal)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

private struct AnimalContent: View {
    
    var animal: Animal
    
    var body: some View {
        ScrollView{
            
            AppText(text:animal.name.capitalized, font: Fonts.rowdies_bold, fontSize: FontSize.medium)
            
            AsyncImageView(imageURL: animal.imageURL)
            
            AppText(text:animal.description, font: Fonts.rowdies_light, fontSize: FontSize.tiny)
        }
        .padding(.horizontal, Dm.medium)
    }
    
}

struct AnimalInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimalInfoScreen(animal: Animal(name: "dog", description: "Dog is human's best companion.", imageURL: "https://i.insider.com/5484d9d1eab8ea3017b17e29?width=600&format=jpeg&auto=webp"))
    }
}
