//
//  HeroCell.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import UIKit

protocol HeroCellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class HeroCell: UITableViewCell, HeroCellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? HeroCellViewModel else { return }

        var content = defaultContentConfiguration()
        content.text = viewModel.heroName
        guard let imageData = ImageManager.shared.fetchImage(from: viewModel.heroImage) else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
