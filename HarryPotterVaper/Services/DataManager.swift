//
//  DataManager.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private var heroes: [Hero] = []
    
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setHeroes(_ heroes: [Hero]) {
        self.heroes = heroes
    }
    
    func getHeroes(at indexPath: IndexPath) -> Hero {
        heroes[indexPath.row]
    }
    
    func setFavoriteStatus(with heroName: String, status: Bool) {
        userDefaults.set(status, forKey: heroName)
    }
    
    func getFavoriteStatus(with heroName: String) -> Bool {
        userDefaults.bool(forKey: heroName)
    }
}
