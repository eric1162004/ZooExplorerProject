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
        
        let modelFile = try! CatOrDog_1(configuration: MLModelConfiguration())
        
        // try to initialize animal classier model
        guard let model = try? VNCoreMLModel(for: modelFile.model) else { fatalError("Loading CoreML Model Failed")}
        
        // construct a prediction request
        let request = VNCoreMLRequest(model: model) { request, Error in

            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            // for debugging
            for result in results {
                print(result.identifier)
                print("\(Double(result.confidence))")
            }
            
            // return result with the highest confidence
            if let firstResult = results.first {
                var identifier = firstResult.identifier
                identifier = identifier.prefix(1).capitalized + identifier.dropFirst()
                completionHandler(.success(identifier))
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
