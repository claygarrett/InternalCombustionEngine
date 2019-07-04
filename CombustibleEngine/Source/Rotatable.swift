//
//  Rotatable.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

protocol ChangeNotifier {
    func notifyOfChange()
}

protocol Rotatable: AnyObject, Debuggable, ChangeNotifier {
    var rotation: Double { get set }
    func rotate(degrees: Double, rotator: Rotator?)
}

extension Rotatable {
    func clampTo360(_ value: Double) -> Double {
        var newValue = value
        while newValue >= 360 {
            newValue -= 360
        }
        
        while newValue < 0 {
            newValue += 360
        }
        
        return newValue
    }
}

extension Rotatable {
    func rotate(degrees: Double, rotator: Rotator?) {
        rotation = clampTo360(degrees + rotation)
        notifyOfChange()
    }
}

extension Rotatable where Self: Rotator {
    func rotate(degrees: Double, rotator: Rotator?) {
        rotation = clampTo360(degrees + rotation)
        for connection in rotatableConnections where connection.rotatable !== rotator {
            connection.rotate(degrees: degrees, rotator: self)
        }
        notifyOfChange()
    }
}

protocol Rotator: AnyObject {
    var rotatableConnections: [RotatableConnection] { get set }
    func getRotatableConnections()->[RotatableConnection]
    func addRotatableConnection(_: RotatableConnection)->()
    func addRotatableConnections(_: [RotatableConnection])->()
}

extension Rotator {
    func getRotatableConnections() -> [RotatableConnection] {
        return rotatableConnections
    }
    
    func addRotatableConnection(_ connection: RotatableConnection) {
        rotatableConnections.append(connection)
    }
    
    func addRotatableConnections(_ connections: [RotatableConnection]) {
        rotatableConnections.append(contentsOf: connections)
    }
}

typealias ReciprocalRotatableConnection = (RotatableConnection, RotatableConnection)

struct RotatableConnection: Debuggable {
    var name: String = "Rotatable Connection"
    
    func debugPrint(indent: Int) {
        print(name)
    }
    
    let rotatable: Rotatable
    let ratio: Double
    
    init(rotatable: Rotatable, ratio: Double) {
        self.rotatable = rotatable
        self.ratio = ratio
    }
    
    // we need the rotator to ensure we don't rotate back the thing that rotated us
    func rotate(degrees: Double, rotator: Rotator) {
        rotatable.rotate(degrees: degrees / ratio, rotator: rotator)
    }
    
    static func generateReciprocalConnection(source: Rotatable, destination: Rotatable, sourceToDestRatio: Double) -> ReciprocalRotatableConnection {
        let sourceToDestinationConnection = RotatableConnection(rotatable: destination, ratio: sourceToDestRatio)
        let desintationToSourceConnection = RotatableConnection(rotatable: source, ratio: 1.0 / sourceToDestRatio)
        return (sourceToDestinationConnection, desintationToSourceConnection)
    }
}


protocol LinearToRotationalTranslator {
    func convertDistanceToDegrees(distance: Float, degrees: Float)
}

protocol RotationalToLinearTranslator: Rotator {
    var circumfrence: Double { get set }
    func rotateByLinearMovement(distance: Double, translator: Translator?)
}
