//
//  User.swift
//  MVVMUIKit
//
//  Created by thaxz on 30/09/23.
//

import Foundation

// API: https://reqres.in/api/users?page=2

struct PersonResponse: Codable {
    let data: [Person]
}

struct Person: Codable {
    let email: String
    let firstName: String
    let lastName: String
}

