//
//  AnimalInfoScreen.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct AnimalInfoScreen: View {
    
    var animal: Animal
    
    var body: some View {
        ScrollView{
        
            AppText(text:animal.name.capitalized, font: Fonts.rowdies_bold, fontSize: FontSize.medium)
            
            AsyncImage(url: URL(string: animal.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            
            AppText(text:animal.description, font: Fonts.rowdies_light, fontSize: FontSize.tiny)
        }
        .padding()
        .padding(.vertical, Dm.large)
        .ignoresSafeArea()
    }
}

struct AnimalInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimalInfoScreen(animal: Animal(name: "dog", description: "Dog is human's best companion.", imageURL: "https://i.insider.com/5484d9d1eab8ea3017b17e29?width=600&format=jpeg&auto=webp"))
    }
}
