//
//  NetworkManager.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import RxSwift
import RxCocoa
import Moya
import Moya_ObjectMapper
import ObjectMapper

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<NetWorkService>()
    
    init() {}
    
    
    public func getPosts(with id: Int) -> Single<NetoworkModelResponse> {
        
        provider.rx
            .request(.getPostId(id: 1))
            .filterSuccessfulStatusAndRedirectCodes()
            .mapObject(NetoworkModelResponse.self)
        
    }
    
}










