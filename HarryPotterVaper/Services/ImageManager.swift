//
//  ImageManager.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation
import Alamofire

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from stringUrl: String, completion: @escaping(Result<Data, AFError>) -> Void, completionWithCompletedString: @escaping(Progress?) -> Void) {
        AF.download(stringUrl)
            .validate()
            .downloadProgress { progress in
                completionWithCompletedString(progress)
            }
            .responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
