//
//  Flywheel.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class FlyWheel: Rotatable, Rotator {
    var didChange = PassthroughSubject<Void, Never>()
    
    func notifyOfChange() {
        didChange.send(Void())
    }
    
    var name: String = "Flywheel"
    func debugPrint(indent: Int) {
        print(name)
    }
    
    
//    let numTeeth: UInt
    var rotation: Double
    var rotatableConnections: [RotatableConnection] = []
    
    init(rotation: Double) {
        self.rotation = rotation
        
    }

}
