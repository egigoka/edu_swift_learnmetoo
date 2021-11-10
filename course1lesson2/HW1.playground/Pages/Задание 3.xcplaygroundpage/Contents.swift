import Foundation

/*:
 ### Задание 3
 
 Необходимо вычислить площадь и периметр прямоугольного треугольника.
 
 >Условия:
 Катеты прямоугольного треугольника:
 AC = 8.0, CB = 6.0. Гипотенузу треугольника AB вычисляем при помощи функции `sqrt(Double)`, заменив `Double` суммой квадратов катетов
 
 */
// Катеты прямоугольного треугольника
let sideAC = 8.0
let sideCB = 6.0

// Гипотенуза треугольника
let sideAB = sqrt(sideAC * sideAC + sideCB * sideCB)

// Площадь треугольника
let triangleAria = sideAC * sideCB / 2

// Периметр треугольника
let trianglePerimetr = sideAC + sideCB + sideAB


//: [Ранее: Задани 2](@previous) | Задание 3 из 3
