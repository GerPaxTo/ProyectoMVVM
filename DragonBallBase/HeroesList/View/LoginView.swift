//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 19/01/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    var token: String = ""
    
    let headerLabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.monospacedSystemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Proyecto MVVM"
        return label
    }()
    
    let headerSubLabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "View - View Model - Model"
        return label
    }()
    
    let userLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuario:"
        return label
    }()
    
    let userText = {
        let text = UITextField()
        text.textColor = .black
        text.backgroundColor = .white
        text.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.keyboardType = .emailAddress
        text.placeholder = "email"
        text.textContentType = .emailAddress
        return text
    }()
    
    let pwdLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password:"
        return label
    }()
    
    let pwdText = {
        let text = UITextField()
        text.textColor = .black
        text.backgroundColor = .white
        text.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true
        text.placeholder = "Password"
        return text
    }()
    
    let buttonLogin = {
        var confButton = UIButton.Configuration.filled()
        confButton.title = "Login"
        confButton.baseBackgroundColor = .blue
        confButton.image = UIImage(systemName: "pencil.and.outline")
    
        let button = UIButton()
        button.configuration = confButton
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonTapped), for: .allEvents)
        
        return button
    }()
    
    let errorLabel = {
        let label = UITextField()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    @objc func buttonTapped(sender: UIButton) {
        var email: String? = ""
        var pwd: String? = ""
        
        email = userText.text
        pwd = pwdText.text
        
        if email != "" &&  pwd != "" {
            let apiClient = ApiClient()
            
            apiClient.login(user: email ?? "", password: pwd ?? "", completion: { token, error in
                if let token = token {
                    LoginViewModel.shared.save(token: token)
                    self.errorLabel.text  = "You are logged in"
                    
                    DispatchQueue.main.async {
                    UIApplication
                            .shared
                            .connectedScenes
                            .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                            .first?
                            .rootViewController = HeroesListViewControlller()
                    }
                    
                } else {
                    print("Error")
                }
            })
        }
    }
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(headerSubLabel)
        addSubview(userLabel)
        addSubview(userText)
        addSubview(pwdLabel)
        addSubview(pwdText)
        addSubview(buttonLogin)
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),  // Margen izquierdo
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            headerSubLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            headerSubLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerSubLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerSubLabel.heightAnchor.constraint(equalToConstant: 20),
            
            userLabel.topAnchor.constraint(equalTo: headerSubLabel.bottomAnchor, constant: 80),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userText.widthAnchor.constraint(equalToConstant: 150),
            userLabel.heightAnchor.constraint(equalToConstant: 20),
            
            userText.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 10),
            userText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userText.heightAnchor.constraint(equalToConstant: 40),
            
            pwdLabel.topAnchor.constraint(equalTo: userText.bottomAnchor, constant: 20),
            pwdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pwdLabel.widthAnchor.constraint(equalToConstant: 150),
            pwdLabel.heightAnchor.constraint(equalToConstant: 20),
            
            pwdText.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 10),
            pwdText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pwdText.widthAnchor.constraint(equalToConstant: 150),
            pwdText.heightAnchor.constraint(equalToConstant: 40),
            
            buttonLogin.topAnchor.constraint(equalTo: pwdText.bottomAnchor, constant: 50),
            buttonLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            buttonLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            buttonLogin.heightAnchor.constraint(equalToConstant: 40),
            
            errorLabel.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 50),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
