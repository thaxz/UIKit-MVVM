//
//  PersonView.swift
//  MVVMUIKit
//
//  Created by thaxz on 30/09/23.
//

import UIKit

class PersonView: UIView {

    //MARK: Components
    
    private lazy var subscribeBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "SUBSCRIBE"
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    private lazy var nameLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var emailLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tswift13@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
           let vw = UIStackView()
            vw.axis = .vertical
            vw.spacing = 8
            vw.translatesAutoresizingMaskIntoConstraints = false
            return vw
        }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()){
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonView {
    
    func setup(){
        // Background config
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStackView)
        // to work as a VStack
        personStackView.addArrangedSubview(nameLb)
        personStackView.addArrangedSubview(emailLb)
        personStackView.addArrangedSubview(subscribeBtn)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            // STACK
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton){
        action()
    }
}
