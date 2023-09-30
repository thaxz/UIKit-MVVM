//
//  PeopleViewModel.swift
//  MVVMUIKit
//
//  Created by thaxz on 30/09/23.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(_ error: Error)
}

class PeopleViewModel {
    
    private(set) var people = [Person]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let personRes = try decoder.decode(PersonResponse.self, from: data)
                self?.people = personRes.data
                self?.delegate?.didFinish()
            } catch {
                self?.delegate?.didFail(error)
                print(error)
            }
        }
    }
}
