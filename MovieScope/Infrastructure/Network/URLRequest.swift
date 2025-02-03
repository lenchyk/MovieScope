//
//  URLRequest.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation
 
extension URLRequest {
    static func request(
        for endpoint: Endpoint,
        httpMethod: HTTPMethod = .get
    ) -> URLRequest {
        let stringURL = AppConfigurator.value(for: .baseAPIURL) + endpoint.rawValue
        guard let url = URL(string: stringURL) else {
            fatalError(APIError.invalidURL.errorDescription)
        }
        var request = URLRequest(url: url, timeoutInterval: BaseAPIService.Constants.kURLTimeoutInterval)
        let accessToken = AppConfigurator.value(for: .accessToken)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = BaseAPIService.Constants.kURLTimeoutInterval
        request.addValue(accessToken, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
        return request
    }
}
