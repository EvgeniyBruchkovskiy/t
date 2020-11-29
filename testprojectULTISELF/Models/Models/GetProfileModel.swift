//
//  GetProfileModel.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import Alamofire

struct GetProfileModel {
    var queryId: String = ""
    var encoding: ParameterEncoding = JSONEncoding.default
    var params: [String:Any]?
    
    init(type: User.GetProfileType, id: Int) {
        switch type {
        case .byProfile:
            self.queryId = "/\(id)"
            self.encoding = JSONEncoding.default
        case .byUser:
            self.encoding = URLEncoding.default
            self.params = ["user_id":id]
        }
    }
}
