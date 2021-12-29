//
//  UserListRequest.swift
//  DiscourseClient
//
//  Created by Guido Mola on 27/12/2021.
//

import Foundation
struct UserRequest: APIRequest {
    
    typealias Response = UsersResponse
    
   
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return ["period" : "all"]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
