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
}
