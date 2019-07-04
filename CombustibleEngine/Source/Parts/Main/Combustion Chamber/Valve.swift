//
//  Valve.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/1/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

enum ValveState {
    case closed
    case open
    
    func getName() -> String {
        switch self {
        case .closed:
            return "closed"
        case .open:
            return "open"
        }
    }
}

class Valve {
    private var valveState: ValveState
    
    init(valveState: ValveState) {
    self.valveState = valveState
    }
    
    func getValveState() -> ValveState {
    return valveState
    }
    
    func setValveState(_ state: ValveState) -> () {
    self.valveState = state
    }
}
