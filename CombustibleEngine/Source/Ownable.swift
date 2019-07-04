//
//  Ownable.swift
//  Combustible Engine
//
//  Created by Clay Garrett on 6/2/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import Foundation


protocol Ownable: AnyObject {
    var ownedBy:AnyObject? { get set }
    func takeOwnership(withObject:AnyObject)
    func isOwnedBy(object:AnyObject) -> Bool
}

extension Ownable {
    func takeOwnership(withObject object:AnyObject) {
        guard let owner = ownedBy else {
            ownedBy = object
            return
        }
        
        if owner === object {
            // we're already owned by this object
            return
        }
        
        fatalError("\(object) tried to own \(self) but it is already owned by \(owner)")
    }
    
    func isOwnedBy(object:AnyObject) -> Bool {
        guard let owner = ownedBy else {
            return false
        }
        return owner === object
    }
}
