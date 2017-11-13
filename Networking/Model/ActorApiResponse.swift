//
//  ActorApiResponse.swift
//  Networking
//
//  Created by Jyo Mithun on 18/10/2017.
//  Copyright © 2017 m-innotech. All rights reserved.
//

import Foundation
import ObjectMapper
class ActorApiResponse: Mappable{
    var actors: [Actor]?
    required init?(map: Map) {
        
    }
    //Mapping
    func mapping(map: Map) {
        actors <- map ["actors"]
    }
}
class Actor: Mappable {
    var name : String?
    var des : String?
    var country : String?
    var spouse : String?
    var imageURL : String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        name <- map["name"]
        des <- map["description"]
        spouse <- map["spouse"]
        country <- map["country"]
        imageURL <- map["image"]
    }
}
