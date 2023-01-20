//
//  HeroesInteractor.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

protocol HeroesInteractorInputProtocol {
    init(presenter: HeroesInteractorOutputProtocol)
    func fetchHeroes()
    func getHero(at indexPath: IndexPath)
}

protocol HeroesInteractorOutputProtocol: AnyObject {
    func heroesDidReceive(_ heroes: [Hero])
    func heroDidReceive(_ hero: Hero)
}

class HeroesInteractor: HeroesInteractorInputProtocol {
    unowned let presenter: HeroesInteractorOutputProtocol
    
    required init(presenter: HeroesInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchHeroes() {
        NetworkManager.shared.fetchData(from: Link.harryPotterApi.rawValue) { [unowned self] result in
            switch result {
            case .success(let heroes):
                self.presenter.heroesDidReceive(heroes)
                DataManager.shared.setHeroes(heroes)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHero(at indexPath: IndexPath) {
        let hero = DataManager.shared.getHeroes(at: indexPath)
        presenter.heroDidReceive(hero)
    }
}
