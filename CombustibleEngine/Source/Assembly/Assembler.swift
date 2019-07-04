//
//  Assembler.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class Assembler: BindableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var pistons: [Piston] = []
    var displayLink: CADisplayLink!
    
    
    // parts
    var crankshaft:Crankshaft!
    var flywheel:FlyWheel!
    var intakeCam:Camshaft!
    var exhaustCam:Camshaft!
    
    
    var frameCount: Int = 0
    
    lazy var starterDegreesPerTick:Double = { () -> Double in
        let rpm:Double = 120.0 // revolutions per minute
        let rps = rpm / 60.0 // 60 seconds/minute
        let rpf = rps / 60.0 // 60 frames/second
        return 360.0 * rpf
    }()
    
    init() {
        displayLink = CADisplayLink(target: self, selector: #selector(tick))
        displayLink.preferredFramesPerSecond = 60
        displayLink.add(to: .current, forMode: .default)
        assemble()
    }
    
    @objc func tick() {
        // tick all the things that need ticking
        crankshaft.name = "New Cra"
        flywheel.rotate(degrees: starterDegreesPerTick, rotator: nil)
        DispatchQueue.main.async {
            self.didChange.send(Void())
        }
        
    }
    
    func assemble() -> Void {
        // create flywheel/crankshaft, and assemble them together
        flywheel = FlyWheel(rotation: 0)
        crankshaft = Crankshaft(rotation: 0)
        let crankshaftToFlywheel = RotatableConnection.generateReciprocalConnection(source: crankshaft, destination: flywheel, sourceToDestRatio: 1)
        crankshaft.addRotatableConnection(crankshaftToFlywheel.0)
        flywheel.addRotatableConnection(crankshaftToFlywheel.1)
        
        // create the intake / exhaust valves
        let intakeValves = [
            Valve(valveState: .open),
            Valve(valveState: .open),
            Valve(valveState: .open),
            Valve(valveState: .open)
        ]
        
        let exhaustValves = [
            Valve(valveState: .open),
            Valve(valveState: .open),
            Valve(valveState: .open),
            Valve(valveState: .open)
        ]
        
        // create the intake and exhaust camshafts
        intakeCam = Camshaft(rotation: 0, type: .intake, valves: intakeValves)
        exhaustCam = Camshaft(rotation: 0, type: .exhaust, valves: exhaustValves)
        
        // hook up the camshafts to the flywheel
        // TODO: This connection should go through the timing belt
        let flywheelToIntakeCam = RotatableConnection(rotatable: intakeCam, ratio: 2)
        let flywheelToExhaustCam = RotatableConnection(rotatable: exhaustCam, ratio: 2)
        
        flywheel.addRotatableConnection(flywheelToIntakeCam)
        flywheel.addRotatableConnection(flywheelToExhaustCam)
        
        // create pistons
        let piston1 = Piston(translation: 0, airGasMixtureLevel: 0, exhaustLevel: 0, intakeValveState: .open, exhaustValveState: .closed)
        let piston2 = Piston(translation: 100, airGasMixtureLevel: 1, exhaustLevel: 0, intakeValveState: .closed, exhaustValveState: .closed)
        let piston3 = Piston(translation: 100, airGasMixtureLevel: 0, exhaustLevel: 1, intakeValveState: .closed, exhaustValveState: .closed)
        let piston4 = Piston(translation: 0, airGasMixtureLevel: 0, exhaustLevel: 0, intakeValveState: .closed, exhaustValveState: .open)
        
        pistons = [piston1, piston2, piston3, piston4]
        
        crankshaft.rotate(degrees: 20, rotator: nil)
        print(flywheel.rotation)
    }
}
