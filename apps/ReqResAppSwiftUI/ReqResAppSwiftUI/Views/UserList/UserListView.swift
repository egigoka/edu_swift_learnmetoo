//
//  UserListView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct UserListView: View {
    @State private var userListViewModel = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            List(userListViewModel.users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    UserRowView(user: user)
                }
            }
            .listStyle(.plain)
            .overlay {
                if userListViewModel.isLoading {
                    if #available(iOS 17, *) {
                        ContentUnavailableView("Loading...", systemImage: "hourglass")
                    } else {
                        ProgressView()
                    }
                }
            }
            .onAppear {
                if userListViewModel.users.isEmpty {
                    Task {
                        await userListViewModel.fetchUsers()
                    }
                }
            }
            .navigationTitle("User List")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: { userListViewModel.isPresentingNewUserView = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $userListViewModel.isPresentingNewUserView) {
            NewUserView(
                newUserViewModel: NewUserViewModel(), userListViewModel: userListViewModel
            )
        }
    }
}


#Preview {
    UserListView()
}
