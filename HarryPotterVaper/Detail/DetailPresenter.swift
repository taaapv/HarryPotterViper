//
//  DetailPresenter.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import Foundation

class DetailPresenter: DetailViewOutputProtocol {

    unowned let view: DetailViewInputProtocol
    var interactor: DetailInteractorInputProtocol!
    
    required init(view: DetailViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.getHero()
    }
    
    func favoriteButtonDidPressed() {
        interactor.toggleFavoriteStatus()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func receiveHero(_ hero: Hero) {
        view.displayName(with: hero.name)
        
        let houseTitle = "House: \(hero.house)"
        view.displayHouse(with: houseTitle)
        
        let patronusTitle = "Patronus: \(hero.patronus)"
        view.displayPatronus(with: patronusTitle)
        
        guard let imageData = ImageManager.shared.fetchImage(from: hero.image) else { return }
        view.displayImage(with: imageData)
    }
    
    func receiveFavoriteStatus(_ status: Bool) {
        view.displayFavoriteButton(with: status)
    }
}
