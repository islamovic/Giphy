//
//  EndPoint.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public typealias Parameters  = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum HTTPMethod: String {
    case get  = "GET"
    case post = "POST"
}

public class EndPoint {
    var path: String?
    var headers: HTTPHeaders?
    var method: HTTPMethod
    var parameters: Parameters?

    public init(path: String? = nil,
                parameters: Parameters? = nil,
                headers: HTTPHeaders? = nil,
                method: HTTPMethod) {

        self.path = path
        self.headers = headers
        self.method = method
        self.parameters = parameters
    }
}

extension EndPoint {

    func buildRequest(from route: EndPoint) throws -> URLRequest {

        guard let path = route.path else {
            throw NetworkError.missingPath
        }
        guard let baseURL = Router.shared.baseURL else {
            throw NetworkError.missingURL
        }

        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = route.method.rawValue

        do {
            switch route.method {
                case .get:
                    try self.configure(bodyParameters: nil, urlParameters: route.parameters, request: &request)
                case .post:
                    try self.configure(bodyParameters: route.parameters, urlParameters: nil, request: &request)
            }
            try self.addition(headers: route.headers, request: &request)
        } catch {
            throw error
        }

        return request
    }

    fileprivate func configure(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParametersEncoder.encode(request: &request, parameters: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameteersEncoder.encode(request: &request, parameters: urlParameters)
            }
        } catch {
            throw error
        }
    }

    fileprivate func addition(headers: HTTPHeaders?, request: inout URLRequest) throws {
        guard let headers = headers else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

    private func isSuccess(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }

    func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccess(urlResponse.statusCode)
    }
}

