//
//  Rotatable.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

protocol Translatable: AnyObject {
    var translation: Double { get set }
    func translate(amount: Double, translator: Translator?)
}

extension Translatable {
    func translate(amount: Double, translator: Translator?) {
        translation += amount
    }
}

extension Translator where Self: Translatable {
    func translate(amount: Double, translator: Translator?) {
        translation += amount
        
        for connection in translatableConnections where connection.translatable !== translator {
            connection.translate(amount: amount, translator: self)
        }
    }
}

protocol Translator: AnyObject {
    var translatableConnections: [TranslatableConnection] { get set }
    func getTranslatableConnections()->[TranslatableConnection]
    func addTranslatableConnection(_: TranslatableConnection)->()
    func addTranslatableConnections(_: [TranslatableConnection])->()
}

extension Translator {
    func getTranslatableConnections() -> [TranslatableConnection] {
        return translatableConnections
    }
    
    func addTranslatableConnection(_ connection: TranslatableConnection) {
        translatableConnections.append(connection)
    }
    
    func addTranslatableConnections(_ connections: [TranslatableConnection]) {
        translatableConnections.append(contentsOf: connections)
    }
}

typealias ReciprocalTranslatableConnection = (TranslatableConnection, TranslatableConnection)

struct TranslatableConnection {
    let translatable: Translatable
    
    init(translatable: Translatable) {
        self.translatable = translatable
    }
    
    // we need the rotator to ensure we don't rotate back the thing that rotated us
    func translate(amount: Double, translator: Translator) {
        translatable.translate(amount: amount, translator: translator)
    }
    
    static func generateReciprocalConnection(source: Translatable, destination: Translatable) -> ReciprocalTranslatableConnection {
        let sourceToDestinationConnection = TranslatableConnection(translatable: destination)
        let desintationToSourceConnection = TranslatableConnection(translatable: source)
        return (sourceToDestinationConnection, desintationToSourceConnection)
    }
}
