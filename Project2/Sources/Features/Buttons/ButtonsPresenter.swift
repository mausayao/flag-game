//
//  ButtonsPresenter.swift
//  Project2
//
//  Created by Maurício Sayão on 30/03/22.
//

protocol ButtonsPresenterLogic {
    func presentButtons(viewModel: ButtonsModel.RequestView.ViewModel)
}

final class ButtonsPresenter: ButtonsPresenterLogic {
    
    weak var viewController: ButtonsDisplayLogic?
    
    func presentButtons(viewModel: ButtonsModel.RequestView.ViewModel) {
        viewController?.displayButtons(viewModel: viewModel)
    }
}
