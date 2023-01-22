//
//  HeroesListTableViewDataSource.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 16/01/23.
//

import Foundation
import UIKit

class HeroesListTableViewDataSource: NSObject, UITableViewDataSource {
    let tableView: UITableView

    var heroes: [HeroModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, heroes: [HeroModel] = []) {
        self.heroes = heroes
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesListViewCell", for: indexPath) as!  HoroeListViewCell
        
        let hero = heroes[indexPath.row]
        
        cell.configure(hero)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexpath indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
