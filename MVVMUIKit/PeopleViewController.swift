//
//  ViewController.swift
//  MVVMUIKit
//
//  Created by thaxz on 29/09/23.
//

import UIKit

class PeopleViewController: UIViewController {
    
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

    private lazy var personContainerView: UIView = {
       let vw = UIView()
        vw.layer.cornerRadius = 10
        vw.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        setup()
    }


}

private extension PeopleViewController {
    
    func setup(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(personContainerView)
        
        personContainerView.addSubview(personStackView)
        // to work as a VStack
        personStackView.addArrangedSubview(nameLb)
        personStackView.addArrangedSubview(emailLb)
        personStackView.addArrangedSubview(subscribeBtn)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            // using container to have a color background
            personContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            personContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            // STACK
            personStackView.topAnchor.constraint(equalTo: personContainerView.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: personContainerView.bottomAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: personContainerView.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: personContainerView.trailingAnchor, constant: -8),
            
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton){
        print("subscribing")
    }
    
}
