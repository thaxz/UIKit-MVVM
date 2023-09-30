//
//  User.swift
//  MVVMUIKit
//
//  Created by thaxz on 30/09/23.
//

import Foundation

// API: https://reqres.in/api/users?page=2

struct UsersResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
