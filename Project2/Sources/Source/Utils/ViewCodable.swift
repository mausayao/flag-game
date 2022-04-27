//
//  ViewCodable.swift
//  Project2
//
//  Created by Maurício Sayão on 14/02/22.
//

import Foundation

public protocol ViewCodable {
    
    func buildHierarchy()
    
    func setupConstraint()
    
    func applyAdditionalChanges()
}

public extension ViewCodable {
    
    func setupView() {
        buildHierarchy()
        setupConstraint()
        applyAdditionalChanges()
    }
}
