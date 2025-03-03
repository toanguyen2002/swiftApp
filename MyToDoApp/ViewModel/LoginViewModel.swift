//
//  LoginViewModel.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 28/2/25.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init(){}
    
    func login() {
        print(username)
        print(password)
        guard !(username.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty,
              !(password.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty else {
            print("Username hoặc Password không hợp lệ!")
            return
        }
        
        print("call login...2")
    }
    
    func validate() {
        
    }
}
