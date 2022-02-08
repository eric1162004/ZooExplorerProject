//
//  MainScreen.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI

struct MainScreen: View {
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
            }
            .navigationTitle("ZOO EXPLORER")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
