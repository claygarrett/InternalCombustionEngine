//
//  PistonRod.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

class PistonRod: Translatable, Translator, LinearToRotationalTranslator {
    
    
    var translatableConnections: [TranslatableConnection] = []
    
    var translation: Double
    
    
    init(translation: Double) {
        self.translation = translation
    }
    
    func convertDistanceToDegrees(distance: Float, degrees: Float) {
        
    }
}
