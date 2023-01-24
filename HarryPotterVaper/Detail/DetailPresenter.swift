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
    
    func saveButtonDidPressed() {
        interactor.sendDataToServer()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func receiveHero(_ hero: Hero) {
        view.displayName(with: hero.name)
        
        let houseTitle = "House: \(hero.house)"
        view.displayHouse(with: houseTitle)
        
        let patronusTitle = "Patronus: \(hero.patronus)"
        view.displayPatronus(with: patronusTitle)
        
        ImageManager.shared.fetchImage(from: hero.image) { [unowned self] result in
            switch result {
            case .success(let imageData):
                self.view.displayImage(with: imageData)
            case .failure(let error):
                print(error)
            }
        } completionWithCompletedString: { [unowned self] progress in
            guard let progress = progress else { return }
            self.view.displayCompletedText(with: progress.localizedDescription)
            self.view.displayProgressView(with: progress.fractionCompleted)
        }
    }
    
    func receiveFavoriteStatus(_ status: Bool) {
        view.displayFavoriteButton(with: status)
    }
}
