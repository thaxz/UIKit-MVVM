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
