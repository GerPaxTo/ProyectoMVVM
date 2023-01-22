//
//  HeroesListView.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 16/01/23.
//

import Foundation
import UIKit

class HeroesListView: UIView {
    
    let headerLabel = {
        let label = UILabel()
        label.textColor = .black
        //label.backgroundColor = .yellow
        label.font = UIFont.monospacedSystemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MVVM"
        return label
    }()
    
    
    let heroesTableView = {
        let tableView = UITableView()
        
        //tableView.backgroundColor = .blue
        tableView.register(HoroeListViewCell.self, forCellReuseIdentifier: "HeroesListViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Crear  / Añadir sub vistas
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),  // Margen izquierdo
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
