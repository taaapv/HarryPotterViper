//
//  DetailViewController.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 29.12.2022.
//

import UIKit

protocol DetailViewInputProtocol: AnyObject {
    func displayName(with title: String)
    func displayHouse(with title: String)
    func displayPatronus(with title: String)
    func displayImage(with imageData: Data)
    func displayFavoriteButton(with status: Bool)
}

protocol DetailViewOutputProtocol {
    init(view: DetailViewInputProtocol)
    func showDetails()
    func favoriteButtonDidPressed()
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var presenter: DetailViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        presenter.favoriteButtonDidPressed()
    }
}

extension DetailViewController: DetailViewInputProtocol {
    func displayName(with title: String) {
        nameLabel.text = title
    }
    
    func displayHouse(with title: String) {
        houseLabel.text = title
    }
    
    func displayPatronus(with title: String) {
        patronusLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        heroImage.image = UIImage(data: imageData)
    }
    
    func displayFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
