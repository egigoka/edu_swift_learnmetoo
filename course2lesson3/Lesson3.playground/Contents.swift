import Foundation

class Animal {
    var name = ""
    var description: String{
        "Animal"
    }
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    override var description: String {
        "Dog"
    }
}

class Cat: Animal {
    override var description: String {
        "Cat"
    }
}

class Bird: Animal {
    override var description: String {
        "Bird"
    }
}

let animal = Animal()
let dog = Dog()
let cat = Cat()
let bird = Bird()

func getClientPet(_ pet: Animal) -> Animal {
    pet
}

let pet = getClientPet(dog)

if pet is Dog {
    print("The animal is Dog")
} else if pet is Cat {
    print("The animal is Cat")
} else if pet is Bird {
    print("The animal is Bird")
}

animal is Animal // true
animal is Dog // false
animal is Cat // false
animal is Bird // false

dog is Animal // true
dog is Dog // true
dog is Cat
dog is Bird
