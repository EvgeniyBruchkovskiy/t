//
//  NetworkProvider.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkProvider {
    static let shared = NetworkProvider()

    func login(email: String, password: String, success:@escaping (User) -> Void, failure:@escaping (_ error: ApiError) -> Void) {
        Alamofire.request(ApiConfig.current.baseUrl + "/api/login", method: .post, parameters: ["email":email,"password":password], encoding: JSONEncoding.default, headers: headers())
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<User>) in
                switch response.result {
                case .success(let userr):
                    guard let token = userr.api_token else { return }
                    KeyChainProvider.shared.save(email: email, password: password)
                    KeyChainProvider.shared.saveToken(token)
                    user = userr 
                    success(userr)
                case .failure(let error):
                    let customError = ApiError(error: error, statusCode: response.response?.statusCode)
                    failure(customError)
                }
            })
    }
    
    func getProfiles(type: User.GetProfileType, id: Int, success:@escaping (String) -> Void, failure:@escaping (_ error: ApiError) -> Void) {
        let profile = GetProfileModel(type: type, id: id)
        Alamofire.request(ApiConfig.current.baseUrl + "/api/user-profiles" + profile.queryId, method: .get, parameters: profile.params, encoding: profile.encoding, headers: headers())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let JSON):
                    success("\(JSON)")
                case .failure(let error):
                    let customError = ApiError(error: error, statusCode: response.response?.statusCode)
                    failure(customError)
                }
            }
//            .responseArray(completionHandler: { (response: DataResponse<[UserProfile]>) in
//                switch response.result {
//                case .success(let profiles):
//
//                case .failure(let error):
//                    let customError = ApiError(error: error, statusCode: response.response?.statusCode)
//                    failure(customError)
//                }
//            })
    }
    
    func logout(success:@escaping () -> Void, failure:@escaping (_ error: ApiError) -> Void) {
        Alamofire.request(ApiConfig.current.baseUrl + "/api/logout", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    success()
                case .failure(let error):
                    let customError = ApiError(error: error, statusCode: response.response?.statusCode)
                    failure(customError)
                }
            }
    }

}

// MARK: - HTTPHeader

extension NetworkProvider {
    func headers() -> HTTPHeaders {
        if let authToken = KeyChainProvider.shared.getToken() {
            return ["Accept" : "application/json", "Authorization" : "Bearer \(authToken)"]
        } else {
            return ["Accept" : "application/json"]
        }
    }
}

