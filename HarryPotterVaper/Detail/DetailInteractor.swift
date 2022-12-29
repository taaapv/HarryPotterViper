//
//  DetailInteractor.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import Foundation

protocol DetailInteractorInputProtocol {
    var isFavorite: Bool { get set }
    init(presenter: DetailInteractorOutputProtocol, hero: Hero)
    func getHero()
    func toggleFavoriteStatus()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    func receiveHero(_ hero: Hero)
    func receiveFavoriteStatus(_ status: Bool)
}

class DetailInteractor: DetailInteractorInputProtocol {
    unowned let presenter: DetailInteractorOutputProtocol
    let hero: Hero
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(with: hero.name)
        } set {
            DataManager.shared.setFavoriteStatus(with: hero.name, status: newValue)
        }
    }
    
    required init(presenter: DetailInteractorOutputProtocol, hero: Hero) {
        self.presenter = presenter
        self.hero = hero
    }
    
    func getHero() {
        presenter.receiveHero(hero)
        presenter.receiveFavoriteStatus(isFavorite)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
        presenter.receiveFavoriteStatus(isFavorite)
    }
}
