import UIKit

//: # Lesson 6
//: ## Классы

let postTitle = "Classes"
let postBody = "Text of the article"
let postAuthor = "Alexey Efimov"

let postTitle2 = "Properties of classes"
let postBody2 = "Text of the article"
let postAuthor2 = postAuthor

class Post {
    var title = ""
    var body = ""
    var author = ""
}

let firstPost = Post()

firstPost.title = "This is my first post"
firstPost.body = "Hello"
firstPost.author = "Efimov Alexey"

print("Author \(firstPost.author) has published  new post '\(firstPost.title)'"
      + " with text '\(firstPost.body)'")

let secondPost = firstPost

secondPost.title = "Second post"
secondPost.body = "A lot of text"
secondPost.author

print("Author \(secondPost.author) has published a new post")

//: ### Методы классов



//: ### Инициализация



//: ### Наследовение



//: ### Полиморфизм


