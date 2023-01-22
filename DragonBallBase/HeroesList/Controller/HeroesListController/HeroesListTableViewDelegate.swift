//
//  HeroesListTableViewDelegate.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 17/01/23.
//

import Foundation
import UIKit

class HeroesListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // When tapped on an specific cell
        // Open an other view controller to show hero details
        
        didTapOnCell?(indexPath.row)
    }
}
