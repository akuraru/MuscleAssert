//
//  MuscleAssert.swift
//  MuscleAssert
//
//  Created by akuraru on 2016/12/17.
//
//

public class MuscleAssert {
    public class func deepStricEqual<T: Equatable>(actual: T, expected: T, message: @autoclosure () -> String? = nil) -> String? {
        if !deepEqual(actual: actual, expected: expected) {
            let differences = diff(expected: expected, actual: actual)
            return format(message: message(), differences: differences)
        }
        return nil
    }
    class func deepEqual<T: Equatable>(actual: T, expected: T) -> Bool {
        if actual == expected {
            return true
        }
        return false
    }
    class func diff<T: Equatable>(expected: T, actual: T) -> [MuscleAssertDifference] {
        if let expected  = expected as? String, let actual = actual as? String {
            return diff(expected: expected, actual: actual)
        }
        return []
    }
    class func diff(expected: String, actual: String) -> [MuscleAssertDifference] {
        return diff(expected: expected as NSString, actual: actual as NSString)
    }
    class func diff(expected: NSString, actual: NSString) -> [MuscleAssertDifference] {
        let expectedLength = expected.length
        let actualLength = actual.length
        var length = min(expectedLength, actualLength)
        for index in 0..<length {
            if expected.character(at: index) != actual.character(at: index) {
                return [MuscleAssertDifference(
                    path: String(index),
                    expected: expected.substring(from: index) as String,
                    actual: actual.substring(from: index) as String
                )]
            }
        }
        if expectedLength == actualLength {
            return []
        } else if length == expectedLength {
            return [MuscleAssertDifference(
                path: String(length),
                expected: "",
                actual: actual.substring(from: length) as String
            )]
        } else {
            return [MuscleAssertDifference(
                path: String(length),
                expected: expected.substring(from: length) as String,
                actual: ""
            )]
        }
        return []
        
    }
    
    class func format(message: String?, differences: [MuscleAssertDifference]) -> String {
        if differences.isEmpty {
            return message ?? ""
        }
        var text = (message != nil) ? message! + "\n" : "\n"
        for diff in differences {
            text += "path: .\(diff.path)\nactual: \(diff.actual)\nexpected: \(diff.expected)\n"
        }
        
        return text
    }
}

struct MuscleAssertDifference {
    let path: String
    let expected: String
    let actual: String
}
