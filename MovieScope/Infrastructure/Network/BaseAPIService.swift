//
//  BaseAPIService.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum APIError: LocalizedError {
    case emptyData
    case invalidJSON
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError
    
    var errorDescription: String {
        switch self {
        case .emptyData:
            "Error: you have empty data."
        case .invalidJSON:
            "Error: invalid JSON structure."
        case .invalidURL:
            "Error: invalid URL."
        case .invalidResponse:
            "Error: invalid response."
        case .statusCode(let code):
            "Error: erroneuos status code \(code) of the request."
        case .decodingError:
            "Error: while decoding JSON."
        }
    }
}

enum HTTPHeaderField: String {
    case authorization = "Authorization"
}

class BaseAPIService {
    enum Constants {
        static let kURLTimeoutInterval: TimeInterval = 10
    }
    
    static func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.statusCode(httpResponse.statusCode)
        }
        return data
    }
}

