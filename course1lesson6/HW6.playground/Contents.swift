import UIKit

//: # Home Work 6

/*:
 ## Задание 1
 1.1 Создайте класс `Orange` со следующими свойствами:
 
 - `color: String`
 
 - `taste: String`
 
 - `radius: Double`
 
 Необходимо реализовать возможность создания экземпляра класса с пустыми значениями для свойств *color* и *taste*. Свойство *radius* должно быть обязательным, т.е. не должно быть возможности создать экземпляр класса без указания радиуса.
 
 Объявите геттер *orangeVolume*, возвращающий объем апельсина. Расчет объема необходимо реализовать в методе *calculateOrangeVolume* (число Пи в Swift можно получить через константу `Double.pi`. Формулу расчета можно погуглить).
 */

class Orange {
    var color: String
    var taste: String
    let radius: Double
    
    var orangeVolume: Double {
        return calculateOrangeVolume()
    }
    
    init(color: String = "Unknown", taste: String = "Unknown", radius: Double) {
        self.color = color
        self.taste = taste
        self.radius = radius
    }
    
    private func calculateOrangeVolume() -> Double {
        4.0 / 3.0 * Double.pi * pow(radius, 3)
    }
    
}

//: 1.2 Создайте экземпляр класса `Orange`, вызвав при этом инициализатор  только для радиуса

let orange = Orange(radius: 5)

/*: 1.3 Присвойте остальным свойствам, созданного экземпляра класса, следующие значения:
 
 - `color` — *Orange*

 - `taste` — *Sweet*
 */

orange.color = "Orange"
orange.taste = "Sweet"

/*:
1.4 Выведите на консоль сообщение «Orange has <...> color and <...> taste. The volume of orange is <...>». Обращайтесь к этим значениям через экземпляр класса.
 */

print("Orange have \(orange.color) color and \(orange.taste) taste. The volume "
      + "of orange is \(String(format: "%.2f", orange.orangeVolume))")
 
/*:
 ## Задание 2
 2.1 Создайте класс `Shape` (родительский класс) со следующими свойствами:
 
 - `height: Float`
 
 - `width: Float`
 
 - `radius: Float`
 
 - `square: Float`
 
 - `perimeter: Float`
 
 Oбъявите в классе методы `squareOfShape` и `perimeterOfShape` для расчетов площади и периметра (длины) фигуры соответственно. Методы должены возвращать `Float`. Создайте инициализатор для сторон прямоугольника и отдельный инициализатор для радиуса.
 */

class Shape {
    
    var height: Float = 0
    var width: Float = 0
    var radius: Float = 0
    var square: Float = 0
    var perimeter: Float = 0
    
    init(height: Float, width: Float) {
        self.height = height
        self.width = width
    }
    
    init(radius: Float) {
        self.radius = radius
    }
    
    func squareOfShape() -> Float {
        0
    }
    
    func perimeterOfShape() -> Float {
        0
    }
    
}

/*:
 2.2. Создайте классы `Circle`, `Rectangle` и `Ellipse`, унаследовав их от `Shape`. Переопределите методы `squareOfShape` и `perimeterOfShape` для каждого класса в соответствии с правилом расчета площади или периметра (длины) конкретной фигуры

 2.3 В каждом классе создайте метод `description`, который выводит на консоль сообщение следующего вида: «Площадь фигуры <тип фигуры> равна <... >, периметр (длина) равна <...>»
 */

class Circle: Shape {
    
    override func squareOfShape() -> Float {
        Float.pi * pow(radius, 2)
    }
    
    override func perimeterOfShape() -> Float {
        2.0 * Float.pi * radius
    }
    
    func description() {
        print("Area of Circle is \(squareOfShape()), perimeter is "
              + "\(perimeterOfShape())")
    }
}

class Rectangle: Shape {
    override func squareOfShape() -> Float {
        height * width
    }
    
    override func perimeterOfShape() -> Float {
        2 * (height + width)
    }
    
    func description() {
        print("Area of Rectangle is \(squareOfShape()), perimeter is "
              + "\(perimeterOfShape())")
    }
}

class Ellipse: Shape {
    override func squareOfShape() -> Float {
        Float.pi * height / 2 * width / 2
    }
    
    override func perimeterOfShape() -> Float {
        // are you kidding?
        let a = height / 2
        let b = width / 2
        let h = pow((a - b), 2) / pow((a + b), 2)

        return Float.pi * (a + b) * (1 + 3 * h / (10 + sqrt(4 - 3 * h)))
    }
    
    func description() {
        print("Area of Ellipse is \(squareOfShape()), perimeter is "
              + "\(perimeterOfShape())")
    }
}

//: 2.4 Создайте по экземпляру каждого класса, кроме `Shape`, проинициализируйте свойства `height` и `width` или `radius` для каждого класса в любые значения и вызовите у каждого экземпляра класса метод `description`

let circle = Circle(radius: 2.5)
let rectangle = Rectangle(height: 7, width: 12)
let ellipse = Ellipse(height: 5, width: 10)

circle.description()
rectangle.description()
ellipse.description()
 
/*:
 ## Задание 3
 3.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */

class Employee {
    let salary: Int
    let name: String
    let surname: String
    
    init(salary: Int, name: String, surname: String) {
        self.salary = salary
        self.name = name
        self.surname = surname
    }
    
}
 
//: 3.2 Создайте массив из 5 объектов под названием `names` со следующими элементами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` с элементами: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*

let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]

//: 3.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*

var employees: [Employee] = []

for _ in 1...10 {
    if let name = names.randomElement(), let surname = surnames.randomElement() {
        employees.append(Employee(salary: Int.random(in: 1000...2000), 
                                  name: name,
                                  surname: surname))
    }
}

//: 3.4 Пройдитесь по массиву `employees` при помощи `for-in` и выведите информацию по каждому объекту в виде: «<имя> <фимилия>’s salary is $<... >»

func printEmployeesInfo(_ employees: [Employee]) {
    for employee in employees {
        print("\(employee.name) \(employee.surname)'s salary is "
              + "$\(employee.salary)")
    }
}

printEmployeesInfo(employees)

//: 3.5 Создайте отдельный массив на основании `employees`, который включает только тех работников, зарплата которых чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 3.4

let employeesWithEvenSalary = employees.filter { $0.salary % 2 == 0 }

print("Even salary:")

printEmployeesInfo(employeesWithEvenSalary)

