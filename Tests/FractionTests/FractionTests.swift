import XCTest
@testable import Fraction

class FractionTests: XCTestCase {

    func testInit() {
        XCTAssertEqual(Fraction(13,8)!, Fraction(26,16)!)
        XCTAssertEqual(Fraction(-5,3)!, Fraction(10,-6)!)
        XCTAssertNotEqual(Fraction(13,8)!, Fraction(3,7)!)
        XCTAssertNil(Fraction(5,0))
    }

    func testAdd() {
      XCTAssertEqual(Fraction(1,2)! + Fraction(3,4)!, Fraction(5,4)!)
      XCTAssertEqual(Fraction(1,100)! + Fraction(2,100)!, Fraction(3,100)!)
      XCTAssertEqual(Fraction(9,12)! + Fraction(-1,16)!, Fraction(11,16)!)
      XCTAssertEqual(Fraction(5,2)! + Fraction(7,12)!, Fraction(37,12)!)
      XCTAssertEqual(Fraction(1,3)! + Fraction(7,-2)!, Fraction(-19,6)!)
      XCTAssertNotEqual(Fraction(-2,3)! + Fraction(11,13)!, Fraction(1,2)!)
    }

    func testSubtract() {
      XCTAssertEqual(Fraction(9,12)! - Fraction(1,16)!, Fraction(11,16)!)
      XCTAssertEqual(Fraction(3,4)! - Fraction(7,-9)!, Fraction(55,36)!)
      XCTAssertEqual(Fraction(-11,13)! - Fraction(6,3)!, Fraction(-37,13)!)
    }

    func testMultiply() {
      XCTAssertEqual(Fraction(3,4)! * Fraction(4,3)!, Fraction(1,1)!)
      XCTAssertEqual(Fraction(5,4)! * Fraction(4,-5)!, Fraction(-1,1)!)
      XCTAssertEqual(Fraction(9,12)! * Fraction(1,3)!, Fraction(1,4)!)
      XCTAssertEqual(Fraction(7,-11)! * Fraction(11,13)!, Fraction(7,-13)!)
    }

    func testDivide() {
      XCTAssertEqual(Fraction(1,10)! / Fraction(1,2)!, Fraction(1,5)!)
      XCTAssertEqual(Fraction(4,7)! / Fraction(5,10)!, Fraction(8,7)!)
      XCTAssertEqual(Fraction(4,11)! / Fraction(-5,9)!, Fraction(36,-55)!)
      XCTAssertNil(Fraction(3,5)! / Fraction(0,4)!)
    }

    static var allTests = [
        ("testInit", testInit), ("testAdd", testAdd), ("testSubtract", testSubtract), ("testDivide", testDivide),
    ]
}
