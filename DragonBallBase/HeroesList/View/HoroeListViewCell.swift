//
//  HoroeListViewCell.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 16/01/23.
//

import Foundation
import UIKit
import Kingfisher

class HoroeListViewCell: UITableViewCell {
    
    let nameLabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let imgHeroe = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        return imagen
    }()
    
    let descLabel = {
        let label = UILabel()
        
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(nameLabel)
        addSubview(imgHeroe)
        addSubview(descLabel)
        
        NSLayoutConstraint.activate([
           imgHeroe.topAnchor.constraint(equalTo: topAnchor, constant: 16),
           imgHeroe.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
           imgHeroe.widthAnchor.constraint(equalToConstant: 80),
           imgHeroe.heightAnchor.constraint(equalToConstant: 80),
            
           nameLabel.topAnchor.constraint(equalTo: imgHeroe.topAnchor),
           nameLabel.leadingAnchor.constraint(equalTo: imgHeroe.trailingAnchor, constant: 20),
           nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -20),
           nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
           descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
           descLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
           descLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
           descLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(_ model:HeroModel) {
        self.nameLabel.text = model.name
        self.descLabel.text = model.description
        self.imgHeroe.kf.setImage(with: URL(string: model.photo))
        
    }
    
}
