//
//  Camshaft.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum CamshaftType: String {
    case exhaust
    case intake
}


class Camshaft: Rotatable, Rotator {
    var name: String = "Camshaft"

    func debugPrint(indent: Int) {
        print("Camshaft")
    }
    
    
    var didChange = PassthroughSubject<Void, Never>()
    
    func notifyOfChange() {
        didChange.send(Void())
    }

    
    var rotation: Double
    
    var rotatableConnections: [RotatableConnection] = []
    let type: CamshaftType
    var cams: [Cam] = []
    var valves: [Valve] = []
    
    init(rotation: Double, type: CamshaftType, valves: [Valve]) {
        
        let startingCamRotation: Double
        self.type = type
        switch type {
        case .exhaust:
            startingCamRotation = 180
        case .intake:
            startingCamRotation = 270
        }
        
        self.rotation = rotation
        self.valves = valves
        
        let cam1 = Cam(name: "\(type.rawValue) cam 1", rotation: clampTo360(startingCamRotation), valve: valves[0])
        let cam2 = Cam(name: "\(type.rawValue) cam 2", rotation: clampTo360(startingCamRotation - 90), valve: valves[1])
        let cam3 = Cam(name: "\(type.rawValue) cam 3", rotation: clampTo360(startingCamRotation - 180), valve: valves[2])
        let cam4 = Cam(name: "\(type.rawValue) cam 4", rotation: clampTo360(startingCamRotation - 270), valve: valves[3])
        
        cams = [cam1, cam2, cam3, cam4]
        
        for cam in cams {
            cam.rotate(degrees: rotation, rotator: self)
            rotatableConnections.append(RotatableConnection(rotatable: cam, ratio: 1))
        }
    }

    
    func printMe() {
        print("\(type.rawValue) camshaft")
        for cam in cams {
            cam.printMe()
        }
    }
}
