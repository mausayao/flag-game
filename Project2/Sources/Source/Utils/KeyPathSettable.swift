//
//  KeyPathSettable.swift
//  Project2
//
//  Created by Maurício Sayão on 14/02/22.
//

import Foundation

public protocol KeyPathSettable {}

extension KeyPathSettable {
    
    public func setting<Value>(
        _ keyPath: WritableKeyPath<Self, Value>,
        to value: Value
    ) -> Self {
        
        var mutableSelf = self
        mutableSelf[keyPath: keyPath] = value
        return mutableSelf
    }
}

extension KeyPathSettable {
    
    public func setup(_ setup: (inout Self) -> Void) -> Self {
        var mutableSelf = self
        setup(&mutableSelf)
        return mutableSelf
    }
}
