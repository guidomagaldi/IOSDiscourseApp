//
//  CategoryRequest.swift
//  DiscourseClient
//
//  Created by Guido Mola on 28/12/2021.
//

import Foundation
struct CategoryRequest: APIRequest {
    
    typealias Response = CategoriesResponse
    
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
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
