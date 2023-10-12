//
//  FoodListManager.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 10.10.2023.
//

import Foundation

enum NetworkErrorTypes: Error {
    case urlError
    case decodeError
    case any(error: Error)
    
}

class FoodListManager {
    
    static let shared = FoodListManager()
    
    func getFoods(completionHandler: @escaping(Result<FoodsResponse,NetworkErrorTypes>)->Void) {
        
        let urlString : String = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkErrorTypes.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(.any(error: error)))
            }
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(FoodsResponse.self, from: data)
                    completionHandler(.success(decodedData))
                }
                catch{
                    completionHandler(.failure(NetworkErrorTypes.decodeError))
                }
            }
        }.resume()
    }
        
}
