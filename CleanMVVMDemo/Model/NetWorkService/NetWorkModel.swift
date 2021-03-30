//
//  NetWorkModel.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import Foundation
import ObjectMapper
import Moya_ObjectMapper

struct NetoworkModelResponse: Mappable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        
    }
}

