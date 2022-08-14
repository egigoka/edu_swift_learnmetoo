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
    var numberOfComments = 0
    
    func addComent() {
        numberOfComments += 1
    }
    
    
}

let firstPost = Post()

firstPost.title = "This is my first post"
firstPost.body = "Hello"
firstPost.author = "Efimov Alexey"
firstPost.addComent()
firstPost.addComent()

//let secondPost = firstPost
let secondPost = Post()

secondPost.title = "Second post"
secondPost.body = "A lot of text"
secondPost.author

print("Author \(firstPost.author) has published new post '\(firstPost.title)' with text '\(firstPost.body)'")
print("The number of comments for the post '\(firstPost.title)' is \(firstPost.numberOfComments)")

print()

print("Author \(secondPost.author) has published new post '\(secondPost.title)' with text '\(secondPost.body)'")
print("The number of comments for the post '\(secondPost.title)' is \(secondPost.numberOfComments)")


firstPost === secondPost

//: ### Методы классов



//: ### Инициализация

class Human {
    var name = ""
    var age = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let somePerson = Human(name: "Ron", age: 24)

somePerson.name
somePerson.age


//: ### Наследовение



//: ### Полиморфизм


