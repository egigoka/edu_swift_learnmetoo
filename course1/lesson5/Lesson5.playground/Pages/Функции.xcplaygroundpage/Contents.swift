
import Foundation
//: # Lesson 5

//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */

func addingTwoNumbers() {
    let a = 3
    let b = 2
    let c = a + b
    
    print(c)
}

addingTwoNumbers()

//: ### Функции с возвращаемыми значениями

/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */

func addingTwoNumbersWithReturn() -> Int {
    let a = 3
    let b = 2
    
    return a + b
}

var result = addingTwoNumbersWithReturn()

//: ### Функции с параметрами

/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */

// Function with parameters and without arguments
func addingTwoNumbers(a: Int, b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(a: 5, b: 7)

// Function with parameters and arguments

func addingTwoNumbers(number a: Int, andNumber b: Int) -> Int {
    a + b
}

addingTwoNumbers(number: 7, andNumber: 3)

func addingTwoNumbers(_ a: Int, _ b: Int) -> Int {
    a + b
}

addingTwoNumbers(7, 3)

func addingTwoNumbers(_ a: Int, and b: Int) -> Int {
    a + b
}

addingTwoNumbers(9, and: 4)

//: [Next](@next)
