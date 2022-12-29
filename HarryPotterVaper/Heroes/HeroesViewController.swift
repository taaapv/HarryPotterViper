//
//  HeroesViewController.swift
//  HarryPotterVaper
//
//  Created by Татьяна on 27.12.2022.
//

import UIKit

protocol HeroesViewInputProtocol: AnyObject {
    func reloadData(for section: HeroSectionViewModel)
}

protocol HeroesViewOutputProtocol {
    init(view: HeroesViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class HeroesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HeroesViewOutputProtocol!
    
    private let configurator: HeroesConfiguratorInputProtocol = HeroesConfigurator()
    private var section: SectionRowRepresentable = HeroSectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        let configurator: DetailConfiguratorInputProtocol = DetailConfigurator()
        configurator.configure(with: detailVC, and: sender as! Hero)
    }
}

extension HeroesViewController: HeroesViewInputProtocol {
    func reloadData(for section: HeroSectionViewModel) {
        self.section = section
        tableView.reloadData()
    }
}

extension HeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = section.rows[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as? HeroCell
        else { return UITableViewCell() }
        
        cell.viewModel = cellViewModel
        
        return cell
    }
}

extension HeroesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        section.rows[indexPath.row].cellHeight
    }
}
