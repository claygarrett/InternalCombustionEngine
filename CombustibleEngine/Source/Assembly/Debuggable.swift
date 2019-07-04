//
//  Debuggable.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/2/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation

protocol Debuggable {
    var name:String { get set }
//    var debugState:String { get set }
    func debugPrint(indent: Int)
}

extension Debuggable {
    func addSpaces(count: Int, toString string: String) -> String {
        return Array(repeating: " ", count: count).reduce("", { (result, value) -> String in
            return result + value
        }) + string
    }
}
