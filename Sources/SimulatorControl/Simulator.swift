//
//  File.swift
//  
//
//  Created by Michael Verges on 4/16/20.
//

import Foundation

public struct Simulator {
    
    public let name: String
    
    public static let all = Simulator("booted")
    
    public init(_ name: String) {
        self.name = name
    }
    
    /// Open the simulator app
    @discardableResult
    public func setStatusBar(
        time: String? = nil,
        dataNetwork: String? = nil,
        wifiMode: String? = nil,
        wifiBars: Int? = nil,
        cellularMode: String? = nil,
        cellularBars: Int? = nil,
        batteryState: String? = nil,
        batteryLevel: Int? = nil
    ) -> Int32 {
        var args: [String] = []
        
        if let time = time { args += ["--time", time] }
        
        if let dataNetwork = dataNetwork { args += ["--dataNetwork", dataNetwork] }
        if let wifiMode = wifiMode { args += ["--wifiMode", wifiMode] }
        if let wifiBars = wifiBars { args += ["--wifiBars", "\(wifiBars)"] }
        if let cellularMode = cellularMode { args += ["--cellularMode", cellularMode] }
        if let cellularBars = cellularBars { args += ["--cellularBars", "\(cellularBars)"] }
        
        if let batteryState = batteryState { args += ["--batteryState", batteryState] }
        if let batteryLevel = batteryLevel { args += ["--batteryLevel", "\(batteryLevel)"] }
        
        return xcrun(["simctl", "boot", name, "override"] + args)
    }
    
    /// Boot a device
    @discardableResult
    public func boot() -> Int32 {
        return xcrun(["simctl", "boot", name])
    }
    
    /// Open the simulator app
    @discardableResult
    public func show() -> Int32 {
        return open(["-a", "Simulator"])
    }
    
    /// Open a URL in a device
    /// - Parameter url: webpage `https://` or deeplink (e.g. `maps://`)
    @discardableResult
    public func openurl(_ url: String) -> Int32 {
        return xcrun(["simctl", "openurl", name, url])
    }
    
    /// Add photos, live photos, videos, or contacts to the library of a device
    /// - Parameter path: media filepaths
    @discardableResult
    public func addMedia(_ path: String...) -> Int32 {
        return xcrun(["simctl", "addmedia", name] + path)
    }
    
    /// Capture screenshot of simulator
    /// - Parameter output: filepath to store the screenshot
    @discardableResult
    public func screenshot(_ output: String) -> Int32 {
        return xcrun(["simctl", "io", name, "screenshot", output])
    }
    
    /// Erase a device's contents and settings
    @discardableResult
    public func erase() -> Int32 {
        return xcrun(["simctl", "erase", name])
    }
    
    /// Shutdown a device
    @discardableResult
    public func shutdown() -> Int32 {
        return xcrun(["simctl", "shutdown", name])
    }
}
