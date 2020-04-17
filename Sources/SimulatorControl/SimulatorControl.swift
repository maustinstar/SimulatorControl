import Foundation

struct SimulatorControl {
    var text = "Hello, World!"
}

@discardableResult
func xcrun(_ command: [String]) -> Int32 {
    let task = Process()
    task.arguments = command
    if #available(OSX 10.13, *) {
        task.executableURL = URL(fileURLWithPath: "/usr/bin/xcrun")
        do { try task.run() }
        catch { print("Error: \(error.localizedDescription)") }
    }
    task.waitUntilExit()
    return task.terminationStatus
}

@discardableResult
func open(_ command: [String]) -> Int32 {
    let task = Process()
    task.arguments = command
    if #available(OSX 10.13, *) {
        task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
        do { try task.run() }
        catch { print("Error: \(error.localizedDescription)") }
    }
    task.waitUntilExit()
    return task.terminationStatus
}
