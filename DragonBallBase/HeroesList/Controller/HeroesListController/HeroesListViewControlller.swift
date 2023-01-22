//
//  HeroesListViewControlller.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 16/01/23.
//

import Foundation
import UIKit

class HeroesListViewControlller: UIViewController {
    var tableViewDelegate: HeroesListTableViewDelegate?
    var mainView: HeroesListView { self.view as! HeroesListView }
    var heroes: [HeroModel] = []
    
    var viewModel: HeroeListViewModel?
    
    var tableViewDataSource: HeroesListTableViewDataSource?
    
    override func loadView() {
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HeroesListTableViewDelegate()
        mainView.heroesTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciaDatos()
        getData()
        setUpTableDelegate()
    }
    
    func iniciaDatos() {
        viewModel = HeroeListViewModel()
        viewModel?.updateUI = {[weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
    }
    
    func getData() {
        viewModel?.fetchData()
    }
    
    func setUpTableDelegate() {
        tableViewDelegate?.didTapOnCell = {[weak self] index in
            guard let datasource = self?.tableViewDataSource else {
                return
            }
            // get hero in the  hero list according to the posotion index
            let hero = datasource.heroes[index]
            
            // prepare de view controller that I want to predsent
            
            let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
            
            // present de controller to show details
            
            self?.present(heroDetailViewController, animated: true)
        }
        
    }
    
}
