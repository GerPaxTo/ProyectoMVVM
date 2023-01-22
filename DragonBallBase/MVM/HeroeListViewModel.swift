//
//  HeroeListViewModel.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 16/01/23.
//

import Foundation

class HeroeListViewModel: NSObject {
    
    override init() {
        
    }
    
    var updateUI: ((_ heroes: [HeroModel]) -> Void)?
    
    func fetchData() {
        //let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJpZGVudGlmeSI6IjdBQjhBQzRELUFEOEYtNEFDRS1BQTQ1LTIxRTg0QUU4QkJFNyIsImVtYWlsIjoiYmVqbEBrZWVwY29kaW5nLmVzIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.Gg26nDb-Swz0SSD0v_JGn4W02YXlt701un3Gjs5hMVw"
        
        let myToken = LoginViewModel.shared.getToken()
        
        let apiClient = ApiClient(token: myToken)
        apiClient.getHeroes { [weak self] heroes, error in
            self?.updateUI?(heroes)
        }
    }
}
