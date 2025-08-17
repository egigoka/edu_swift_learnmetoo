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
            List(UserListViewModel.users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    UserRowView(user: user)
                }
            }
            .listStyle(.plain)
            .onAppear {
                userListViewModel.fetchUsers()
            }
            .navigationTitle("User List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { userListViewModel.isPresentingNewUserView = true}) {
                        Image(Image(systemName: "plus"))
                    }
                }
            }
        }
        .sheet(isPresented: $userListViewModel.isPresentingNewUserView) {
            NewUserView(
                userListViewModel: userListViewModel,
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
