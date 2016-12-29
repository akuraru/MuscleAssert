//
//  MuscleAssertStringTests.swift
//  MuscleAssert
//
//  Created by akuraru on 2016/12/25.
//
//

import Foundation
import MuscleAssert
import XCTest

class MuscleAssertStringTests : XCTestCase {
    func testEmpty() {
        let diff = MuscleAssert.deepStricEqual(actual: "", expected: "")
        XCTAssertNil(diff)
    }
    func testLongEqual() {
        let diff = MuscleAssert.deepStricEqual(actual: "abc", expected: "abc")
        XCTAssertNil(diff)
    }
    func testEmptyExpected() {
        let diff = MuscleAssert.deepStricEqual(actual: "a", expected: "")!
        XCTAssertEqual(diff,
            "\npath: .0\n" + "actual: a\n" + "expected: \n"
        )
    }
    func testEmptyActual() {
        let diff = MuscleAssert.deepStricEqual(actual: "", expected: "b")!
        XCTAssertEqual(diff,
            "\npath: .0\n" + "actual: \n" + "expected: b\n"
        )
    }
    func testFirst() {
        let diff = MuscleAssert.deepStricEqual(actual: "a", expected: "b")!
        XCTAssertEqual(diff,
            "\npath: .0\n" + "actual: a\n" + "expected: b\n"
        )
    }
    func testLongActual() {
        let diff = MuscleAssert.deepStricEqual(actual: "abc123", expected: "abc")!
        XCTAssertEqual(diff,
            "\npath: .3\n" + "actual: 123\n" + "expected: \n"
        )
    }
    func testLongExpected() {
        let diff = MuscleAssert.deepStricEqual(actual: "abc", expected: "abc123")!
        XCTAssertEqual(diff,
            "\npath: .3\n" + "actual: \n" + "expected: 123\n"
        )
    }
}
