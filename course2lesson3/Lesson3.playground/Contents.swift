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

// animal is Animal // true
// animal is Dog // false
// animal is Cat // false
// animal is Bird // false
//
// dog is Animal // true
// dog is Dog // true
// dog is Cat // false
// dog is Bird // false

func getPets() -> [Animal] {
    var pets: [Animal] = []

    let numberOfDogs = Int.random(in: 1...10)
    let numberOfCats = Int.random(in: 1...10)
    let numberOfBirds = Int.random(in: 1...10)

    for _ in 1...numberOfDogs {
        let dog = Dog()
        pets.append(dog)
    }

    for _ in 1...numberOfCats {
        let cat = Cat()
        pets.append(cat)
    }

    for _ in 1...numberOfBirds {
        let bird = Bird()
        pets.append(bird)
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

print("There are \(dogCount) dogs, \(catCount) cats, \(birdCount) birds")

func walk(with dog: Dog) {
    print("Walking with \(dog.name)")
}

func cleanLitterbox(for cat: Cat) {
    print("Cleaning the \(cat.name) litter box")
}

func cleanCage(for bird: Bird) {
    print("Remove the \(bird.name) feathers at the bottom of the cage")
}

for pet in pets {
    if let dog = pet as? Dog {
        walk(with: dog)
    } else if let cat = pet as? Cat {
        cleanLitterbox(for: cat)
    } else if let bird = pet as? Bird {
        cleanCage(for: bird)
    }
}

let items: [Any] = [1, "Tod", 7.6, dog]

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

print(getSum(cards: cards))
