//
//  ImageClassifier.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import SwiftUI
import CoreML
import Vision

class ImageClassifier {
    
    func detectImage(_ userSelectedImage: UIImage, completionHandler: @escaping ((Result<String, Error>) -> Void)) {
        
        // try to convert UIImage to CIImage
        guard let ciImage = CIImage(image: userSelectedImage) else {
            fatalError("cannot convert to ciimage")
        }
        
        // try to initialize animal classier model
        guard let model = try? VNCoreMLModel(for: AnimalClassifier().model) else { fatalError("Loading CoreML Model Failed")}
        
//        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else { fatalError("Loading CoreML Model Failed")}
        
        // construct a prediction request
        let request = VNCoreMLRequest(model: model) { request, Error in

            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
        
            // get the first word in the results
//            if let firstResult = results.first {
//
//                let animalName = firstResult.identifier.components(separatedBy: ",")[0]
////                let animalName = firstResult.identifier
//                completionHandler(.success(animalName))
//            }
            
            if let firstResult = results.first {
                
                let animalName = firstResult.identifier
                print("predicted anmial:", animalName)
                completionHandler(.success(animalName))
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        do{
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
}
