//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    var isRegistered: Bool {
        name != ""
    }
    var name = ""
    
    func save(name: String){
        UserDefaults.standard.set(name, forKey: "username")
    }
    
    func load(){
        name = UserDefaults.standard.string(forKey: "username") ?? ""
    }
}
