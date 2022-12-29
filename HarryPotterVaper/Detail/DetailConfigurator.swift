//
//  DetailConfigurator.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import Foundation

protocol DetailConfiguratorInputProtocol {
    func configure(with viewController: DetailViewController, and hero: Hero)
}

class DetailConfigurator: DetailConfiguratorInputProtocol {
    func configure(with viewController: DetailViewController, and hero: Hero) {
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter, hero: hero)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
