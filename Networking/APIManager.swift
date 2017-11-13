//
//  APIManager.swift
//  Networking
//
//  Created by Jyo Mithun on 18/10/2017.
//  Copyright © 2017 m-innotech. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
class APIMananer {
    static let shared = APIMananer()
    private init() {
        
    }
    func fetchActorsFromApi() -> Promise<[Actor]>{
        return Promise<[Actor]>{
            fullfil,reject -> Void in
            return Alamofire.request(API_URL).responseString{
                response in
                switch(response.result) {
                case .success(let responseString): print(responseString)
                let actorResponse = ActorApiResponse(JSONString:"\(responseString)")
                fullfil((actorResponse?.actors!)!)
                case .failure(let error): print(error)
                reject(error)
                    
                }
            }
        }
        
    }
}
