import XCTest
@testable import SimulatorControl

final class SimulatorControlTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SimulatorControl().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
