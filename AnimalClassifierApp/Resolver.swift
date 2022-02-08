//
//  Resolver.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
  public static func registerAllServices() {
      
      // instantiate viewModels
      register { MainViewModel() }.scope(.application)
      
      // provide a singleton of ImageClassifier
      register { ImageClassifier() }.scope(.application)
      
      // provide a singleton of WikiService
      register { WikiService() }.scope(.application)
  }
    
}
