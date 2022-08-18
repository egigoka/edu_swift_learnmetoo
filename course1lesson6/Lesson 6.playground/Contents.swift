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
    var description: Int {
        numberOfComments
    }
   
    private var numberOfComments = 0
    
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
//firstPost.numberOfComments = 60
//firstPost.description = 60

//let secondPost = firstPost
let secondPost = Post()

secondPost.title = "Second post"
secondPost.body = "A lot of text"
secondPost.author

print("Author \(firstPost.author) has published new post '\(firstPost.title)' with text '\(firstPost.body)'")
print("The number of comments for the post '\(firstPost.title)' is \(firstPost.description)")

print()

print("Author \(secondPost.author) has published new post '\(secondPost.title)' with text '\(secondPost.body)'")
print("The number of comments for the post '\(secondPost.title)' is \(secondPost.description)")

print()


firstPost === secondPost

//: ### Методы классов



//: ### Инициализация

class Human {
    var name = ""
    var age = 0
    
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
    
    func walk() {
        print("I can walk")
    }
    
    func sleep() {
        print("I need sleep")
    }
    
    func eat() {
        print("I need food")
    }
}

let somePerson = Human(name: "Ron", age: 24)
let human = Human(name: "Tim Cook")

somePerson.name
somePerson.age

human.name
human.age


//: ### Наследовение

class Child: Human {
    
    func nursing() {
        if age <= 5 {
            print("I need care")
        } else {
            print("I can eat independently")
        }
    }
    
    func parenting() {
        if age >= 5 && age <= 13 {
            print("I need an education")
        } else if age < 5 {
            print("It's too early for education")
        } else {
            print("It's too late for education")
        }
    }
    
}

let littleBoy = Child(name: "Tom", age: 4)
littleBoy.sleep()
littleBoy.eat()
littleBoy.nursing()
littleBoy.parenting()
print()

class SchoolChild: Child {
    
    func schooling() {
        if age >= 6 && age <= 17 {
            print("I have to go to school")
        } else {
            print("I'm still to young for school")
        }
    }
}

let schoolGirl = SchoolChild(name: "Sara", age: 8)

schoolGirl.schooling()
schoolGirl.nursing()
schoolGirl.parenting()
schoolGirl.sleep()
print()

//: ### Полиморфизм

class Shape {
    func draw() {
        print("Draw some shape")
    }
}

class Rectangle: Shape {
    override func draw() {
        super.draw()
        print("Draw Rectangle")
    }
}

class Triangle: Shape {
    override func draw() {
        print("Draw Triangle")
    }
}

class Circle: Shape {
    override func draw() {
        print("Draw Circle")
    }
}

//func drawRectangle(_ rectangle: Rectangle) {
//    rectangle.draw()
//}
//
//func drawTriangle(_ triangle: Triangle) {
//    triangle.draw()
//}
//
//func drawCircle(_ circle: Circle) {
//    circle.draw()
//}

func drawShape(_ shape: Shape) {
    shape.draw()
}

let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()

drawShape(rectangle)
drawShape(triangle)
drawShape(circle)

//drawRectangle(rectangle)
//drawTriangle(triangle)
//drawCircle(circle)
