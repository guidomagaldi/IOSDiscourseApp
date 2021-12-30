//
//  UserDetailRequest.swift
//  DiscourseClient
//
//  Created by Guido Mola on 28/12/2021.
//

import Foundation

struct UserDetailRequest: APIRequest {
    
    typealias Response = UserDetail
    
    let username: String
    
    init(username: String) {
        self.username = username
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/users/\(username).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
