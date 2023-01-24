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
        content.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        content.imageProperties.cornerRadius = 40
        content.text = viewModel.heroName
        
        ImageManager.shared.fetchImage(from: viewModel.heroImage) { [unowned self] result in
            switch result {
            case .success(let imageData):
                content.image = UIImage(data: imageData)
                self.contentConfiguration = content
            case .failure(let error):
                print(error.localizedDescription)
                self.contentConfiguration = content
            }
        } completionWithCompletedString: { progress in
            content.secondaryText = progress?.localizedDescription
        }
    }
}
