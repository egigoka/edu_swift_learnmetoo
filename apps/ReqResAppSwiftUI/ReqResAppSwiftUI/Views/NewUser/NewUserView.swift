//
//  SwiftUIView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct NewUserView: View {
    @State var newUserViewModel: NewUserViewModel
    let userListViewModel: UserListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                TextField("First name", text: $newUserViewModel.firstName)
                TextField("Last name", text: $newUserViewModel.lastName)
            }
            .navigationTitle("New user")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        userListViewModel.dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        Task {
                            await newUserViewModel.addUser(to: userListViewModel)
                            userListViewModel.dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewUserView(newUserViewModel: NewUserViewModel(), userListViewModel: UserListViewModel())
}
