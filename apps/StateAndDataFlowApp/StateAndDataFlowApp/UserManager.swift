//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import SwiftUI
import Combine

class UserManager: ObservableObject {
    @AppStorage("isRegistered") var isRegistered = false {
        willSet {
            objectWillChange.send()
        }
    }
    @AppStorage("userName") var name = "" {
        willSet {
            objectWillChange.send()
        }
    }
    @Published
}
