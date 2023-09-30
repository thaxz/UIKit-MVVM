//
//  ViewController.swift
//  MVVMUIKit
//
//  Created by thaxz on 29/09/23.
//

import UIKit

class PeopleViewController: UIViewController {
    
    //MARK: Components

    private lazy var personView: PersonView = {
       let vw = PersonView()
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
        self.view.addSubview(personView)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            // using container to have a color background
            personView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            personView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        ])
    }
}
