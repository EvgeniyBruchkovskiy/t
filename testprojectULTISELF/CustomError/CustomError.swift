//
//  CustomError.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import Foundation

struct ApiError {
    let error: Error
    let statusCode: Int?

    init(error: Error, statusCode: Int? = nil) {
        self.error = error
        self.statusCode = statusCode
    }
}

extension ApiError: LocalizedError {
    var errorDescription: String? { return error.localizedDescription }
}
