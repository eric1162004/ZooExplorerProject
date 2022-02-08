//
//  MainViewModel.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import Foundation
import Resolver
import Alamofire


class MainViewModel: ObservableObject {
    
    @Published var wikiService: WikiService = Resolver.resolve()
    
    @Published var imageClassifier: ImageClassifier = Resolver.resolve()
    
    @Published var selectedImage: UIImage?
    
    @Published var predictedAnimal: Animal?
    
    func predictAnimal(image: UIImage){
        
        if let selectedImage = selectedImage {
            imageClassifier.detectImage(selectedImage) { [weak self] result in
                switch result {
                    case .success(let predictedAnimalName):
                    
                        print("predicted animal: ", predictedAnimalName)
                    
                        self?.predictedAnimal = Animal(name: predictedAnimalName)
                        self?.getAnimalInfoFromWiki(animalName: self?.predictedAnimal?.name ?? "")
                    
                    case .failure(_):
                        print("cannot get predicted animal name.")
                }
            }
        }
    }
    
    func getAnimalInfoFromWiki(animalName: String) {
        
        if let predictedAnimal = predictedAnimal {
            wikiService.getRequestInfo(searchItemName: predictedAnimal.name) { result in
                switch result {
                    case .success(let wikiData):
                    
                        self.predictedAnimal?.description = wikiData.itemDescription
                        self.predictedAnimal?.imageURL = wikiData.itemImageUrl
                    
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }

}
