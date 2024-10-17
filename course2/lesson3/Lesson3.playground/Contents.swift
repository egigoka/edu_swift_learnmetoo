import Foundation

class Animal {
    var name = ""
    var description: String {
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

func getDog(_ dog: Dog) -> Dog {
    dog
}

let pet = getDog(dog)
//let petCat = getDog(cat)

func getClientPet(_ pet: Animal) -> Animal {
    pet
}

let petAnimal = getClientPet(dog)

if petAnimal is Dog {
    print("The animal is Dog")
} else if petAnimal is Cat {
    print("The animal is Cat")
} else if petAnimal is Bird {
    print("The animal is Bird")
}

//animal is Animal
//animal is Dog
//animal is Cat
//animal is Bird
//
//dog is Animal
//dog is Dog
//dog is Cat
//dog is Bird

func getPets() -> [Animal]{
    var pets: [Animal] = []
    
    let numberOfDogs = Int.random(in: 1...10)
    let numberOfCats = Int.random(in: 1...10)
    let numberOfBirds = Int.random(in: 1...10)
    
    for _ in 1...numberOfDogs {
        pets.append(Dog())
    }
    
    for _ in 1...numberOfCats {
        pets.append(Cat())
    }
    
    for _ in 1...numberOfBirds {
        pets.append(Bird())
    }
    
    return pets
}

let pets = getPets()

var dogCount = 0
var catCount = 0
var birdCount = 0

for pet in pets {
    if pet is Dog {
        dogCount += 1
    } else if pet is Cat {
        catCount += 1
    } else if pet is Bird {
        birdCount += 1
    }
}

print("There are \(dogCount) dogs, \(catCount) cats and \(birdCount) birds.")

func walk(with dog: Dog) {
    print("Walking with \(dog.name)")
}

func cleanLitterBox(for cat: Cat) {
    print("Clining the \(cat.name)'s litterbox")
}

func cleanCage(for bird: Bird) {
    print("Remove the \(bird.name)'s feathers at the bottom of the cage")
}

for pet in pets {
    if let dog = pet as? Dog {
        walk(with: dog)
    } else if let cat = pet as? Cat {
        cleanLitterBox(for: cat)
    } else if let bird = pet as? Bird {
        cleanCage(for: bird)
    }
}

let items: [Any] = [1, "Todd", 7.6, dog]

let firstItem = items.first

if let firstItem = firstItem as? Int {
    print(firstItem + 4)
}

var cards: [Any] = [2, 3, 5, "Queen", "King"]

func getSum(cards: [Any]) -> Int {
    var total = 0
    
    for card in cards {
        if let cardWithNumber = card as? Int {
            total += cardWithNumber
        } else if let _ = card as? String {
            total += 10
        }
    }
    
    return total
}

getSum(cards: cards)
