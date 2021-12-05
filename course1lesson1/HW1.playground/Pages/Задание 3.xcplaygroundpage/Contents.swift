import Foundation

/*:
 ### Задание 3
 
 Необходимо вычислить площадь и периметр прямоугольного треугольника.
 
 >Условия:
 Катеты прямоугольного треугольника:
 AC = 8.0, CB = 6.0. Гипотенузу треугольника AB вычисляем при помощи функции `sqrt(Double)`, заменив `Double` суммой квадратов катетов
 
 */

let triangleLineAC = 8.0
let triangleLineCB = 6.0

let triangleLineBA = sqrt(triangleLineAC * triangleLineAC + triangleLineCB * triangleLineCB)

let triangleArea = triangleLineAC * triangleLineCB / 2

let trianglePerimetr = triangleLineAC + triangleLineBA + triangleLineCB
//: [Ранее: Задани 2](@previous) | Задание 3 из 3
