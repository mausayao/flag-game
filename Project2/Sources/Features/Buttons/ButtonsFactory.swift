//
//  ButtonsFactory.swift
//  Project2
//
//  Created by Maurício Sayão on 16/02/22.
//

import Foundation

final class ButtonsFactory {
    
    func setup() -> ButtonsViewController {
        let view = ButtonsView()
        let presenter = ButtonsPresenter()
        let interactor = ButtonsInteractor(presenter: presenter)
        let viewController = ButtonsViewController(view: view, interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
