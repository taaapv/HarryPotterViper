//
//  NetworkManager.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case harryPotterApi = "https://hp-api.onrender.com/api/characters"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, completion: @escaping(Result<[Hero], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: [Hero].self) { response in
                switch response.result {
                case .success(let heroes):
                    completion(.success(heroes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func postRequest(to url: String, parameters: Hero) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]

        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
