//
//  ApiConfig.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import Foundation

class ApiConfig {
    static var current = ApiConfig()
    var baseUrl: String {
        return Bundle.main.infoDictionary!["Api Base Url"] as! String
    }
}
