//
//  SwiftUIView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct NewUserView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    @StateObject var newUserViewModel: NewUserViewModel
    
    @Binding var isPresented: Bool
    
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

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView(userListViewModel: UserListViewModel(), newUserViewModel: NewUserViewModel(), isPresented: .constant(true))
    }
}

//#Preview {
//    NewUserView()
//}
