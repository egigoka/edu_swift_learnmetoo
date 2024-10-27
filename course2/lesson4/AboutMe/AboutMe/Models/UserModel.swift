//
//  UserModel.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

struct User {
    let login: String
    let password: String
    
    let username: String
    let imageName: String
    
    let moodEmoji: String
    let mood: String
    let goal: String
    let goalButton: String
    
    let project: String
    let projectImageName: String
    let nextTask: String
}

extension User {
    static func getUsers() -> [User]{
        return [
            User(
                login: "root",
                password: "toor",
                username: "EGiGoka",
                imageName: "RootImage",
                moodEmoji: "😬",
                mood: "Perpetually anxious",
                goal: "Walk for at least an hour",
                goalButton: "Walked",
                project: "Learning Swift",
                projectImageName: "RootProject",
                nextTask: "Start course 2 lesson 5"
            ),
            User(
                login: "guest",
                password: "guestlol",
                username: "Guest",
                imageName: "GuestImage",
                moodEmoji: "🧘",
                mood: "Chill",
                goal: "Idk, come up with something yourself",
                goalButton: "Done",
                project: "Uknown",
                projectImageName: "GuestProject",
                nextTask: "Unknowable horrors"
            )
        ]
    }
}
