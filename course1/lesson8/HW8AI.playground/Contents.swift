import UIKit

//1. Tuples:
//   Create a tuple that represents a book, containing its title (string), author (string), publication year (integer), and rating (double). Print out the book's information using the tuple elements.

let book = ("1984", "George Orwell", 1949, 4.19)

print(book)

print("The book \"\(book.0)\" by \(book.1) is",
      "published in \(book.2)",
      "and received rating of \(book.3)")

//2. Accessing tuple elements:
//   Using the book tuple from the previous task, print out the title and author of the book using dot notation.

print("The book \"\(book.0)\" is written by \(book.1)")

//3. Naming tuple elements:
//   Create a tuple that represents a rectangle, with named elements width and height (both integers). Calculate and print out the area of the rectangle using the named tuple elements.

let rectangle = (width: 10, height: 20)

print("area of rectangle of \(rectangle.width)x\(rectangle.height)",
      "is \(rectangle.width * rectangle.height)")

//4. Tuple decomposition:
//   Write a function that takes a tuple containing a first name (string) and last name (string) and returns a new tuple with the full name (concatenated first and last name) and the length of the full name. Decompose the returned tuple into separate constants and print them out.

func getFullName(name: String, surname: String)
        -> (fullName: String, length: Int) {
    let fullName = "\(name) \(surname)"
    return (fullName, fullName.count)
}

let (fullName, length) = getFullName(name: "Alexey", surname: "Efimov")

print("Full name: \"\(fullName)\", length is \(length)")

//5. Returning tuples from functions:
//   Create a function that takes in a radius (double) and returns a tuple containing the circumference and area of a circle with that radius. Call the function with a sample radius and print out the circumference and area.

func getCircleProperties(radius: Double)
-> (circumference: Double, area: Double)? {
    
    guard radius > 0 else {
        return nil
    }
    
    let circumference = 2 * Double.pi * radius
    let area = Double.pi * pow(radius, 2)
    
    return (circumference, area)
}

let radius = 12.0

let properties = getCircleProperties(radius: radius)

if let(circumference, area) = properties {
    print("The circle of radius \(radius) have",
          "circumference of \(String(format: "%.3f", circumference))",
          "and area of \(String(format: "%.3f", area))")
}

//6. Guard statement:
//   Write a function that takes an optional integer array and calculates the average of the elements. Use a guard statement to check if the array is not nil and has at least one element. If the guard condition fails, print an error message and return nil. If the guard condition passes, calculate and return the average.

func average(numbers: [Int]?) -> Double? {
    guard let numbers = numbers, numbers.count > 0 else {
        print("Error: empty or nil argument \"numbers\"")
        return nil
    }
    
    var average = 0.0
    
    for number in numbers {
        average += Double(number)
    }
    
    average /= Double(numbers.count)
    
    return average
}

let numbers = [1, 5, 32, 42, 69]

let numbersAverage = average(numbers: numbers)

if let numbersAverage = numbersAverage {
    print("The average of \(numbers) is \(numbersAverage)")
}

//7. Optional chaining:
//   Create a Student class with optional properties: name (string), grade (integer), and address (Address class). The Address class should have optional properties: street (string), city (string), and zipCode (string). Instantiate a Student object and use optional chaining to print out the student's name, grade, and zip code (if available).

class Student {
    var name: String?
    var grade: Int?
    var address: Address?
}

class Address {
    var street: String?
    var city: String?
    var zipCode: String?
}

var student: Student?
student = Student()
//student = nil
student?.name = "John Doe"
student?.grade = 12
student?.address = Address()
student?.address?.zipCode = "123123"

if let name = student?.name,
   let grade = student?.grade,
   let zipCode = student?.address?.zipCode
    {
    print("The student \(name) is in \(grade) grade",
          "and have zip code \(zipCode)")
}


