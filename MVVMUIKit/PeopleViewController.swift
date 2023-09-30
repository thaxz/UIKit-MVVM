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

    private lazy var personContainer: UIView = {
       let vw = UIView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        setup()
    }


}

private extension PeopleViewController {
    
    func setup(){
        self.view.backgroundColor = .white
        self.view.addSubview(subscribeBtn)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            subscribeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subscribeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton){
        print("subscribing")
    }
    
}
