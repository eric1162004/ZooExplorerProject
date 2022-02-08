//
//  WikiService.swift
//  AnimalClassifierApp
//
//  Created by Eric Cheung on 2022-02-07.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WikiData {
    var itemDescription: String = ""
    var itemImageUrl: String = ""
}

enum NetworkError: Error {
    case networkError
}

class WikiService {
    
    private let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    func getRequestInfo(
        searchItemName: String,
        completionHandler: @escaping( Swift.Result<WikiData, NetworkError> ) -> Void ){
        
        let parameters: [String: String] = [
            "format":"json",
            "action":"query",
            "prop":"extracts|pageimages",
            "exintro": "",
            "explaintext":"",
            "titles": searchItemName,
            "indexpageids":"",
            "redirects": "1",
            "pithumbsize":"500"
        ]
        
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { response in
            if(response.result.isSuccess){
//                print(response)
                
                let itemJSON: JSON = JSON(response.result.value!)
                
                let pageid = itemJSON["query"]["pageids"][0].stringValue
                
                let itemDescription = itemJSON["query"]["pages"][pageid]["extract"].stringValue
                
                let wikiImageURL =  itemJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                
                completionHandler(.success(WikiData(itemDescription: itemDescription, itemImageUrl: wikiImageURL)))
                return
            }
            
            completionHandler(.failure(.networkError))
        }
    }
}

