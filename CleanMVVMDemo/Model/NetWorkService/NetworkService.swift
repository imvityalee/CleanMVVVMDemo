//
//  NetworkService.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import Foundation
import Moya
    
enum NetWorkService {
    case getPostId(id: Int)
}


extension NetWorkService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getPostId(id: let id):
            return "/posts/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPostId:
            return .get
      
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
