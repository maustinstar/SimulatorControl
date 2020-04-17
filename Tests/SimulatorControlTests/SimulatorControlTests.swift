import XCTest
@testable import SimulatorControl

final class SimulatorControlTests: XCTestCase {
    
    override func setUp() {
        let sim = Simulator("iPhone 11")
        sim.boot()
    }
    
//    func testMedia() {
//        XCTAssert(Simulator.all.addMedia("~/Desktop/image.png") == 0)
//    }
    
    func testURL() {
        XCTAssert(Simulator.all.openurl("https://apple.com") == 0)
    }
    
    func testScreenshot() {
        XCTAssert(Simulator.all.screenshot("app-screenshot.png") == 0)
    }
    
    override func tearDown() {
//        Simulator.all.shutdown()
    }

    static var allTests = [
//        ("testMedia", testMedia),
        ("testURL", testURL),
        ("testScreenshot", testScreenshot),
    ]
}
