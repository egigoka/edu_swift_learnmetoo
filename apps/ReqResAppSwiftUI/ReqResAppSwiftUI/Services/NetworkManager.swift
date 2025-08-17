//
//  NetworkManager.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchUsers() -> [User] {
        
        return [User.example]
    }
    
    func postUser(_ user: User) -> PostUserQuery {
        
        return PostUserQuery(firstName: "Jane", lastName: "Flower")
    }
}

// MARK: - Link
extension NetworkManager {
    enum Link {
        case allUsers
        case singleUser
        
        var url: URL {
            switch self {
            case .allUsers:
                return URL(string: "https://reqres.in/api/users?delay=1")!
            case .singleUser:
                return URL(string: "https://reqres.in/api/users/")!
            }
        }
    }
}

enum NetworkError: Error {
    
}
