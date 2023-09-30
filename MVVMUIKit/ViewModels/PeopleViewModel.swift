//
//  PeopleViewModel.swift
//  MVVMUIKit
//
//  Created by thaxz on 30/09/23.
//

import Foundation

class PeopleViewModel {
    
    private(set) var people: [PersonResponse] = []
    
    func getUsers(){
        Task { [weak self] in
            let url = URL(string:"https://reqres.in/api/users")!
            do {
                let (data, _) =  try await URLSession.shared.data(from: url)
                // decoding from snake case
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                // getting data
                self?.people = try  jsonDecoder.decode(UsersResponse.self, from: data).data
                
            } catch {
                print(error)
            }
            
        }
    }
    
    
    
}
