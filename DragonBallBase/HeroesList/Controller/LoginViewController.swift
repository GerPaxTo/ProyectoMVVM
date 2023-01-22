//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 21/01/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    var email: String = ""
    var password: String = ""
    
    override func loadView() {
        view = LoginView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
