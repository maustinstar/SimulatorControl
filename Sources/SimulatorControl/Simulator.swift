//
//  Simulator.swift
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
    
    public enum DataNetwork: String {
        case wifi = "wifi"
        case cell3g = "3g"
        case cell4g = "4g"
        case lte = "lte"
        case lteA = "lte-a"
        case ltePlus = "lte+"
    }
    
    public enum WifiMode: String {
        case searching = "searching"
        case failed = "failed"
        case active = "active"
    }
    
    public enum CellularMode: String {
        case notSupported = "notSupported"
        case searching = "searching"
        case failed = "failed"
        case active = "active"
    }
    
    public enum BatteryState: String {
        case charging = "charging"
        case charged = "charged"
        case failed = "failed"
        case discharging = "discharging"
    }
    
    /// Open the simulator app
    @discardableResult
    public func setStatusBar(
        time: String? = nil,
        dataNetwork: DataNetwork? = nil,
        wifiMode: WifiMode? = nil,
        wifiBars: Int? = nil,
        cellularMode: CellularMode? = nil,
        cellularBars: Int? = nil,
        batteryState: BatteryState? = nil,
        batteryLevel: Int? = nil
    ) -> Int32 {
        var args: [String] = []
        
        if let time = time { args += ["--time", time] }
        
        if let dataNetwork = dataNetwork { args += ["--dataNetwork", dataNetwork.rawValue] }
        if let wifiMode = wifiMode { args += ["--wifiMode", wifiMode.rawValue] }
        if let wifiBars = wifiBars { args += ["--wifiBars", "\(max(min(wifiBars,3),0))"] }
        if let cellularMode = cellularMode { args += ["--cellularMode", cellularMode.rawValue] }
        if let cellularBars = cellularBars { args += ["--cellularBars", "\(max(min(cellularBars,4),0))"] }
        
        if let batteryState = batteryState { args += ["--batteryState", batteryState.rawValue] }
        if let batteryLevel = batteryLevel { args += ["--batteryLevel", "\(max(min(batteryLevel,100),0))"] }
        
        return xcrun(["simctl", "status_bar", name, "override"] + args)
    }
    
    /// Boot a device
    @discardableResult
    public func boot() -> Int32 {
        xcrun(["simctl", "boot", name])
    }
    
    /// Open the simulator app
    @discardableResult
    public func show() -> Int32 {
        open(["-a", "Simulator"])
    }
    
    /// Open a URL in a device
    /// - Parameter url: webpage `https://` or deeplink (e.g. `maps://`)
    @discardableResult
    public func openurl(_ url: String) -> Int32 {
        xcrun(["simctl", "openurl", name, url])
    }
    
    /// Add photos, live photos, videos, or contacts to the library of a device
    /// - Parameter path: media filepaths
    @discardableResult
    public func addMedia(_ path: String...) -> Int32 {
        xcrun(["simctl", "addmedia", name] + path)
    }
    
    /// Install an app on a device
    /// - Parameter path: media filepaths
    @discardableResult
    public func install(_ path: String) -> Int32 {
        xcrun(["simctl", "install", name, path])
    }
    
    /// Install an app on a device
    /// - Parameter path: media filepaths
    @discardableResult
    public func launch(_ bundleID: String) -> Int32 {
        xcrun(["simctl", "launch", name, bundleID])
    }
    
    /// Capture screenshot of simulator
    /// - Parameter output: filepath to store the screenshot
    @discardableResult
    public func screenshot(_ output: String) -> Int32 {
        xcrun(["simctl", "io", name, "screenshot", output])
    }
    
    /// Erase a device's contents and settings
    @discardableResult
    public func erase() -> Int32 {
        xcrun(["simctl", "erase", name])
    }
    
    /// Shutdown a device
    @discardableResult
    public func shutdown() -> Int32 {
        xcrun(["simctl", "shutdown", name])
    }
}
