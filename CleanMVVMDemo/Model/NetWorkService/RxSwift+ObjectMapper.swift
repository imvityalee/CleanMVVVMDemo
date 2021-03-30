//
//  RxSwift+ObjectMapper.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import RxSwift
import ObjectMapper
import Moya_ObjectMapper
import Foundation

extension Observable {
    
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        
        return self.map { response in
            
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJSONError
                
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
    
            guard let array = response as? [Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            guard let dicts = array as? [[String: Any]] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            return Mapper<T>().mapArray(JSONArray: dicts)
        }

    }

}

enum RxSwiftMoyaError: Error {
    case ParseJSONError
    case otherError
}


