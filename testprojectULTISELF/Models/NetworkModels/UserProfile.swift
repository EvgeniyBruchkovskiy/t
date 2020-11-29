//
//  UserProfile.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import ObjectMapper

class UserProfile: Mappable {
        
    var id: Int?
    var user_id: Int?
    var country_id: Int?
    var city: String?
    var age_range_id: Int?
    var phone_number: String?
    var text_message_permission: Bool?
    var physical_activity_level_id: Int?
    var gender: Int?
    var marital_status_id: Int?
    var employment_status_id: Int?
    var income_level_id: Int?
    var created_at: String?
    var updated_at: String?
    var birth_year: Int?
    var mood_level_percent: Int?
    var health_level_percent: Int?
    var prod_level_percent: Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        country_id <- map["country_id"]
        city <- map["city"]
        age_range_id <- map["age_range_id"]
        phone_number <- map["phone_number"]
        text_message_permission <- map["text_message_permission"]
        physical_activity_level_id <- map["physical_activity_level_id"]
        gender <- map["gender"]
        marital_status_id <- map["marital_status_id"]
        employment_status_id <- map["employment_status_id"]
        income_level_id <- map["income_level_id"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        birth_year <- map["birth_year"]
        mood_level_percent <- map["mood_level_percent"]
        health_level_percent <- map["health_level_percent"]
        prod_level_percent <- map["prod_level_percent"]
    }
}
