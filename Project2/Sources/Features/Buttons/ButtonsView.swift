//
//  ButtonsView.swift
//  Project2
//
//  Created by Maurício Sayão on 16/02/22.
//

import UIKit

protocol ButtonViewConfiguration: AnyObject {
    func configure(viewModel: ButtonsModel.RequestView.ViewModel)
}

protocol ButtonsViewDelegate: AnyObject {
    func buttonPressed(_ viewModel: ButtonsModel.RequestView.ViewModel,  with answer: Bool)
}

final class ButtonsView: UIView, ButtonViewConfiguration {
    
    // MARK: - Subviews
    private var button1 = UIButton()
        .setting(\.layer.borderWidth, to: 1)
        .setting(\.layer.borderColor, to: UIColor.lightGray.cgColor)
        .setting(\.tag, to: 0)
        
    private var button2 = UIButton()
        .setting(\.layer.borderWidth, to: 1)
        .setting(\.layer.borderColor, to: UIColor.lightGray.cgColor)
        .setting(\.tag, to: 1)
    
    private var button3 = UIButton()
        .setting(\.layer.borderWidth, to: 1)
        .setting(\.layer.borderColor, to: UIColor.lightGray.cgColor)
        .setting(\.tag, to: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Propeties
    weak var delegate: ButtonsViewDelegate?
    private var viewModel: ButtonsModel.RequestView.ViewModel?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ButtonViewConfiguration
    
    func configure(viewModel: ButtonsModel.RequestView.ViewModel) {
        button1.setImage(UIImage(named: viewModel.countries[0]), for: .normal)
        button2.setImage(UIImage(named: viewModel.countries[1]), for: .normal)
        button3.setImage(UIImage(named: viewModel.countries[2]), for: .normal)
        
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.viewModel = viewModel
    }
    
    // MARK: - Private methods
    
    @objc private func buttonAction(_ sender: UIButton) {
        guard let viewModel = viewModel else {
            return
        }

        delegate?.buttonPressed(viewModel, with: viewModel.correctAnswer == sender.tag)
    }
}

extension ButtonsView: ViewCodable {
    func buildHierarchy() {
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
    }
    
    func setupConstraint() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // buttons sizes
            button1.heightAnchor.constraint(equalToConstant: 100),
            button1.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 100),
            button3.widthAnchor.constraint(equalToConstant: 200),
            
            // constraints
            button1.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            button1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            button2.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 24),
            button3.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 24)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .white
    }
    
}
