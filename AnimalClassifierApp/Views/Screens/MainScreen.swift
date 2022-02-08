//
//  MainScreen.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI
import Resolver

struct MainScreen: View {

    @State private var showPhotoPicker =  false
    
    @ObservedObject var mainVM: MainViewModel = Resolver.resolve()
    
    var body: some View {
        NavigationView{
            VStack{
                if let selectedImage = mainVM.selectedImage {
                
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            showPhotoPicker.toggle()
                        }
                    
                    // navigate to info page
                    if let predictedAnmial = mainVM.predictedAnimal {
                        
                        AppText(text: "This is probably a \(predictedAnmial.name).")
                        
                        NavigationLink(destination: AnimalInfoScreen(
                            animal: predictedAnmial)) {
                            CapsuleButton(label: "Learn more")
                        }
                    }
                    
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            showPhotoPicker.toggle()
                        }
                }
            }
            .padding()
            .navigationTitle("ZOO EXPLORER")
            .sheet(isPresented: $showPhotoPicker) {
                PhotoPicker(image: $mainVM.selectedImage) { image in
                    // do something with the selected image
                    mainVM.predictAnimal(image: image)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
