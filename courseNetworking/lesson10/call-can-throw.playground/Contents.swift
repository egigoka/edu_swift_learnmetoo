import Foundation

enum CalcError: Error {
    case notInteger
    case notNumber
}

func half(_ value: Any) throws  -> Int? {
    if let intValue = value as? Int {
        return intValue / 2
    } else if let doubleValue = value as? Double {
        throw CalcError.notInteger
    }
    return nil
}

let value = 16.0

let someValue = try half(value)
