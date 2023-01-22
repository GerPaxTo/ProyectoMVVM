//
//  HeroDetailViewController.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 17/01/23.
//

import Foundation
import UIKit

class HeroDetailViewController: UIViewController {
    var mainView: HeroDetailView { self.view as! HeroDetailView }
    
    init(heroDetailModel: HeroModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(heroDetailModel)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder) has not been implemented")
    }
    
    override func loadView() {
        view = HeroDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
