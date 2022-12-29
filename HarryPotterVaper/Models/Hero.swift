//
//  Hero.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import Foundation

struct Hero: Decodable {
    let name: String
    let house: House
    let patronus: Patronus
    let image: String
}

enum House: String, Codable {
    case empty = ""
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

enum Patronus: String, Codable {
    case boar = "boar"
    case doe = "doe"
    case empty = ""
    case goat = "goat"
    case hare = "hare"
    case horse = "horse"
    case jackRussellTerrier = "Jack Russell terrier"
    case lynx = "lynx"
    case otter = "otter"
    case persianCat = "persian cat"
    case stag = "stag"
    case swan = "swan"
    case tabbyCat = "tabby cat"
    case weasel = "weasel"
    case wolf = "wolf"
}
