//
//  UserListView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var userListViewModel = UserListViewModel()
    
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
                    ProgressView()
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
                userListViewModel: userListViewModel, newUserViewModel: NewUserViewModel(),
                isPresented: $userListViewModel.isPresentingNewUserView
            )
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
//
//#Preview {
//    UserListView()
//}
