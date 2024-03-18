/*:
 ## Lesson 1
 */

import UIKit

/*:
 ## Комментарий к строке кода
 **Здесь можно писать**
 *много много много*
 > много текста
*/

var str = "Hello, playground"

/*:
 ### Переменные
*/



/*:
 > Футбол - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. Футбол это не просто вид спорта, футбол - это стиль жизни, футбол - это философия. Футбол, вид спорта для сильных духом и целеустремленных людей. Я люблю футбол. Футбол мой любимый вид спорта!
 */

var teamSport = "Футбол"

print("\(teamSport) - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. \(teamSport) это не просто вид спорта, \(teamSport.lowercased()) - это стиль жизни, \(teamSport.lowercased()) - это философия. \(teamSport), вид спорта для сильных духом и целеустремленных людей. Я люблю \(teamSport.lowercased()). \(teamSport) мой любимый вид спорта!\n")

teamSport = "Американский футбол"

print("\(teamSport) - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. \(teamSport) это не просто вид спорта, \(teamSport.lowercased()) - это стиль жизни, \(teamSport.lowercased()) - это философия. \(teamSport), вид спорта для сильных духом и целеустремленных людей. Я люблю \(teamSport.lowercased()). \(teamSport) мой любимый вид спорта!")

/*:
 ### Базовые типы
*/

//teamSport = 10

/*:
 ### Базовые типы в Swift.
*/
/*:
 ### Строковые типы - String
*/

var userName = ""
print("Hello, \(userName)")

/*:
 ### Числовые типы
 #### Int
*/

var age = 38
print("My name is \(userName), I am \(age) years old.")

/*:
 #### Double
*/

var someNumber = 10.99999

/*:
 #### Float
*/

var someFloat: Float = 0.0

someFloat = 121.123444
someFloat = 1221.123444
someFloat = 12321.123444
someFloat = 123421.123444
someFloat = 1234521.123444

/*:
 ### Булево значения
*/

let boolean = true

/*:
 ### Приведение типов
*/

// New constant with type Double
let castIntToDouble = Double(age) + someNumber

// New constant with type Int
let castDoubleToInt = age + Int(someNumber)

// Casting numeric values to strings
let myAge = "I am "
let castIntToString = myAge + String(age) + " years old."

// Casting string values to numeric
let someString = "10"
let castStringToInt = age + (Int(someString) ?? 0)
