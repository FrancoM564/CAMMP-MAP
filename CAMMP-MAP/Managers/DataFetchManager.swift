//
//  DataFetchManager.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 5/08/22.
//

import Foundation

class DataFetchManager: NSObject, ObservableObject{
    
    @Published var locations : [Building] = []
    
    let url = URL(string: "http://cammpdev.ulima.edu.pe/wp-json/itlab/v1/edificios")!
    
    override init() {
        super.init()
        
        self.fetchDataInitial()
    }
    
    func fetchDataInitial(){
        print("Hola")
        URLSession.shared.fetchData(for: url) { (result:Result<[Building],Error>) in
            switch result{
            case .success(let Buildings):
                print("YAY")
                self.locations = Buildings
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func eraseTagFromArray(_ tag : TagInfo){
            print("Nope " + String(tag.id) + tag.tagString)
        }
    
    func numberObjects() -> Int{
        return locations.count
    }
}







extension URLSession {
  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
