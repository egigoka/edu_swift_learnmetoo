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
    
    func fetchUsers() async throws -> [User] {
        let request = 
        
        let (data, _) = try await URLSession.shared.data(from: Link.allUsers.url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let usersQuery = try decoder.decode(UsersQuery.self, from: data)
            return usersQuery.data
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func postUser(_ user: User) async throws -> PostUserQuery {
        var request =
        
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
    case decodingError
}
