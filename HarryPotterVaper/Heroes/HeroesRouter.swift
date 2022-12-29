//
//  HeroesRouter.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

protocol HeroesRouterInputProtocol {
    init(viewController: HeroesViewController)
    func openDetailViewController(with hero: Hero)
}

class HeroesRouter: HeroesRouterInputProtocol {
    unowned let viewController: HeroesViewController
    
    required init(viewController: HeroesViewController) {
        self.viewController = viewController
    }
    
    func openDetailViewController(with hero: Hero) {
        viewController.performSegue(withIdentifier: "showDetail", sender: hero)
    }
    
    
}
