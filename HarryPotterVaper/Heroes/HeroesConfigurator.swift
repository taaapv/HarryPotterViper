//
//  HeroesConfigurator.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

protocol HeroesConfiguratorInputProtocol {
    func configure(with viewController: HeroesViewController)
}

class HeroesConfigurator: HeroesConfiguratorInputProtocol {
    func configure(with viewController: HeroesViewController) {
        let presenter = HeroesPresenter(view: viewController)
        let interactor = HeroesInteractor(presenter: presenter)
        let router = HeroesRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
