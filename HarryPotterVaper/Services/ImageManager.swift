//
//  ImageManager.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from stringUrl: String) -> Data? {
        guard let url = URL(string: stringUrl) else { return nil }
        let imageData = try? Data(contentsOf: url)
        return imageData
    }
}
