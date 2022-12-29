//
//  HeroesPresenter.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

class HeroesPresenter: HeroesViewOutputProtocol {
    
    unowned let view: HeroesViewInputProtocol
    var interactor: HeroesInteractorInputProtocol!
    var router: HeroesRouterInputProtocol!
    
    required init(view: HeroesViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchHeroes()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getHero(at: indexPath)
    }
}

extension HeroesPresenter: HeroesInteractorOutputProtocol {
    func heroesDidReceive(_ heroes: [Hero]) {
        let section = HeroSectionViewModel()
        
        heroes.forEach { hero in
            let cellViewModel = HeroCellViewModel(hero: hero)
            section.rows.append(cellViewModel)
        }
        
        view.reloadData(for: section)
    }
    
    func heroDidReceive(_ hero: Hero) {
        router.openDetailViewController(with: hero)
    }
}
