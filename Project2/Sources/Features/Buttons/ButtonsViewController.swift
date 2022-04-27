//
//  ButtonsViewController.swift
//  Project2
//
//  Created by Maurício Sayão on 16/02/22.
//

import UIKit

protocol ButtonsDisplayLogic: AnyObject {
    func displayButtons(viewModel: ButtonsModel.RequestView.ViewModel)
}

class ButtonsViewController: UIViewController {
    
    private let buttonsView: ButtonsView
    private let interactor: ButtonsInteractor
    private var score = 0
    
    // MARK: - inits
    
    init(view: ButtonsView, interactor: ButtonsInteractor) {
        self.buttonsView = view
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsView.delegate = self
        interactor.requestView()
    }
    
    override func loadView() {
        view = buttonsView
    }
    
    // MARK: - Private Methods
    private func configureGame(viewModel: ButtonsModel.RequestView.ViewModel) {
        let countries = viewModel.countries.shuffled()
        let correctAnwser = Int.random(in: 0...2)
        
        let configured = ButtonsModel.RequestView.ViewModel(
            countries: countries,
            correctAnswer: correctAnwser,
            title: countries[correctAnwser]
        )
        
        buttonsView.configure(viewModel: configured)
        title = "\(configured.title.uppercased()) SCORE: \(score)"
    }
}

extension ButtonsViewController: ButtonsDisplayLogic {
    func displayButtons(viewModel: ButtonsModel.RequestView.ViewModel) {
        configureGame(viewModel: viewModel)
    }
}

extension ButtonsViewController: ButtonsViewDelegate {
    func buttonPressed(_ viewModel: ButtonsModel.RequestView.ViewModel, with answer: Bool) {
        if answer {
            self.score += 1
            self.configureGame(viewModel: viewModel)
            
        } else {
            let alert = UIAlertController(
                title: "Ops!",
                message: "Você errou! Seu score \(score)",
                preferredStyle: .alert
            )
            
            let action = UIAlertAction(title: "ok", style: .default) { _ in
                self.score = 0
                self.configureGame(viewModel: viewModel)
            }
            
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
}
