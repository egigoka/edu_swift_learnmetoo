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
    
    private func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func fetchUsers() async throws -> [User] {
        let request = getRequest(url: Link.allUsers.url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
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
        var request = getRequest(url: Link.singleUser.url)
        request.httpMethod = "POST"
        request.setValue(
            "application/json encoding: utf-8",
            forHTTPHeaderField: "Content-Type"
        )
        
        let userQuery = PostUserQuery(
            firstName: user.firstName,
            lastName: user.lastName
        )
        let jsonData = try? JSONEncoder().encode(userQuery)
        
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(PostUserQuery.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
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
    
    var title: String {
        switch self {
        case .decodingError:
            return "Can't decode received data"
        }
    }
}
