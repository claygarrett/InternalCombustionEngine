//
//  Piston.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

class Piston: Translatable, Translator, Ownable {
    var ownedBy: AnyObject?
    var translation: Double
    var translatableConnections: [TranslatableConnection] = []
    var rod: PistonRod
    var airGasMixtureLevel: Float
    var exhaustLevel: Float
    var intakeValve: Valve
    var exhaustValve: Valve

    init(translation: Double, airGasMixtureLevel: Float, exhaustLevel: Float, intakeValveState: ValveState, exhaustValveState: ValveState) {
        self.translation = translation
        self.rod = PistonRod(translation: 0)
        self.airGasMixtureLevel = airGasMixtureLevel
        self.exhaustLevel = exhaustLevel
        
        intakeValve = Valve(valveState: intakeValveState)
        exhaustValve = Valve(valveState: exhaustValveState)
    }
    
    func connectRod(_ rod: PistonRod) {
        self.rod = rod
        let connection = TranslatableConnection.generateReciprocalConnection(source: self, destination: rod)
        self.addTranslatableConnection(connection.0)
        rod.addTranslatableConnection(connection.1)
    }
    
    func addAirGasMixture(amount: Float) {
        
    }
    
}
