
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
    let c = a + b
    
    print(c)
    return c
}

var result = addingTwoNumbersWithReturn()

//: ### Функции с параметрами

/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */



//: [Next](@next)
