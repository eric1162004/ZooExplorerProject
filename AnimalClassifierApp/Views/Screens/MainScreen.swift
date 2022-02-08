//
//  MainScreen.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI
import Resolver

struct MainScreen: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor
                
                VStack{
                    // Top bar
                    TopBar(title: "Zoo Explorer")
                    MainContent()
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

private struct MainContent : View{
    
    @State private var showPhotoPicker =  false
    
    @ObservedObject var mainVM: MainViewModel = Resolver.resolve()
    
    var body: some View {
        VStack(spacing: Dm.medium){
            if let selectedImage = mainVM.selectedImage {
                
                ZStack(alignment: .topTrailing){
                    
                    ImageView(image: selectedImage)
                    
                    CircularIcon(iconName: "arrow.left.arrow.right")
                        .zIndex(1)
                        .onTapGesture {
                            showPhotoPicker.toggle()
                        }
                }
                
                if let predictedAnmial = mainVM.predictedAnimal {
                    
                    VStack(alignment: .leading){
                        
                        AppText(text: "This is probably a...")
                        
                        AppText(text: "\(predictedAnmial.name)", fontSize: FontSize.medium)
                        
                    }
                    
                    // navigate to info page
                    NavigationLink(destination: AnimalInfoScreen(
                        animal: predictedAnmial)) {
                            CapsuleButton(label: "Learn more")
                        }
                }
                
            } else {
                // show if no image has been selected
                ImageButton()
                    .padding()
                
                CapsuleButton(label: "Select a picture"){
                    showPhotoPicker.toggle()
                }
                
            }
        }
        .padding()
        .sheet(isPresented: $showPhotoPicker) {
            PhotoPicker(image: $mainVM.selectedImage) { image in
                // do something when the user has selected a image
                mainVM.predictAnimal(image: image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
