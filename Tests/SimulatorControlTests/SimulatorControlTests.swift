import XCTest
@testable import SimulatorControl

final class SimulatorControlTests: XCTestCase {
    
    override func setUp() {
        let sim = Simulator("iPhone X")
        sim.boot()
        sim.show()
    }
    
    func testErase() {
        XCTAssert(Simulator.all.erase() == 0)
    }
    
    func testMedia() {
        XCTAssert(Simulator.all.addMedia("~/Desktop/bimsolutions.png") == 0)
    }
    
    func testURL() {
        XCTAssert(Simulator.all.openurl("https://apple.com") == 0)
    }
    
    func testScreenshot() {
        XCTAssert(Simulator.all.screenshot("~/Desktop/app-screenshot.png") == 0)
    }
    
    override func tearDown() {
//        Simulator.all.shutdown()
    }

//    static var allTests = [
//        ("testLaunch", testLaunch),
//    ]
}
