//
//  NetworkManager.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

enum Link: String {
    case harryPotterApi = "https://hp-api.onrender.com/api/characters"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completion: @escaping(_ heroes: [Hero]) -> Void) {
        guard let url = URL(string: Link.harryPotterApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    completion(heroes)
                }
            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
