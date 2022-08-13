
import Foundation
//: # Lesson 5

//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */

func addingTwoNumbersWithoutArgumentsAndWithoutReturn() {
    let a = 3
    let b = 2
    let c = a + b
    
    print(c)
}

addingTwoNumbersWithoutArgumentsAndWithoutReturn()

//: ### Функции с возвращаемыми значениями


/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */

func addingTwoNumbers() -> Int {
    let a = 3
    let b = 2
    
    return a + b
}

var result = addingTwoNumbers()
print(result)

//: ### Функции с параметрами



/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */

// Функция с параметрами без аргументов
func addingTwoNumbers(a: Int, b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(a: 5, b: 7)
print(result)

// Функция с параметрами и аргументами
func addingTwoNumbers(number a: Int, andNumber b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(number: 7, andNumber: 3)
print(result)

func addingTwoNumbers(_ a: Int, _ b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(7, 7)
print(result)

func addingTwoNumbers(_ a: Int, and b: Int) -> Int {
    a + b
}

result = addingTwoNumbers(7, and: 12)
print(result)

//: [Next](@next)
