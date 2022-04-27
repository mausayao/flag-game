//
//  ButtonsInteractor.swift
//  Project2
//
//  Created by Maurício Sayão on 30/03/22.
//

protocol ButtonsInteractorBusinessLogic: AnyObject {
    func requestView()
}

final class ButtonsInteractor: ButtonsInteractorBusinessLogic {
    
    private let presenter: ButtonsPresenterLogic
    
    init(presenter: ButtonsPresenterLogic) {
        self.presenter = presenter
    }
    
    func requestView() {
        
        let viewModel = ButtonsModel.RequestView.ViewModel(
            countries: CountryData.countries.shuffled(),
            correctAnswer: .zero,
            title: CountryData.countries.shuffled()[0]
        )
        
        presenter.presentButtons(viewModel: viewModel)
        
    }
}
