//
//  User.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import ObjectMapper

class User: Mappable {
    
    enum GetProfileType {
        case byUser
        case byProfile
    }
    
    var id: Int?
    var name: String?
    var email: String?
    var email_verified_at: String?
    var created_at: String?
    var updated_at: String?
    var api_token: String?
    var user_avatar: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["data.id"]
        name <- map["data.name"]
        email <- map["data.email"]
        email_verified_at <- map["data.email_verified_at"]
        created_at <- map["data.created_at"]
        updated_at <- map["data.updated_at"]
        api_token <- map["data.api_token"]
        user_avatar <- map["data.user_avatar"]
    }
}


