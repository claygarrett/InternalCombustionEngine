//
//  Cam.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Range {
    let min: Double
    let max: Double
    
    func contains(_ value: Double) -> Bool {
        return value >= min && value <= max
    }
}

class Cam: Rotatable {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    func notifyOfChange() {
        print("Cam changing")
        print("range: \(engagmentRange)")
        print("rotation: \(rotation)")
        if engagmentRange.contains(rotation) {
            valve?.setValveState(.open)
        } else {
            valve?.setValveState(.closed)
        }
        didChange.send(Void())
    }
    
    func debugPrint(indent: Int) {
        print("Cam")
    }
    
    let engagmentRange = Range(min: 250, max: 290)
    
    var rotation: Double
    var name: String
    var valve: Valve?
    
    init(name: String, rotation: Double, valve: Valve) {
        self.rotation = rotation
        self.name = name
        self.valve = valve
    }
    
    func printMe() {
        print("---cam-\(name)--rotation: \(rotation)")
    }
    
    func connectValve(valve: Valve) {
        self.valve = valve
    }

}
