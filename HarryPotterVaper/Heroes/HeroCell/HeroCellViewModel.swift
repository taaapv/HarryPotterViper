//
//  HeroCellViewModel.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class HeroCellViewModel: CellIdentifiable {
    let heroName: String
    let heroImage: String
    
    var cellIdentifier: String {
        "heroCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    init(hero: Hero) {
        heroName = hero.name
        heroImage = hero.image
    }
}

class HeroSectionViewModel : SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
