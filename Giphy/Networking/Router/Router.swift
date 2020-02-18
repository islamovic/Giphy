//
//  Router.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public class Router: NetworkRouter {

    private var task: URLSessionTask?
    private var session: URLSession?

    public var baseURL: URL?

    private init() {

        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess      = true
        configuration.httpCookieAcceptPolicy    = .onlyFromMainDocumentDomain
        configuration.requestCachePolicy        = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 10.0

        session = URLSession(configuration: configuration)
    }

    public static let shared = Router()

    func request(_ router: EndPoint, success: @escaping NetworkRouterSuccessCompletion,
                 failure: @escaping NetworkRouterFailedCompletion) {

        if let session = session {
            do {
                let request = try router.buildRequest(from: router)
                task = session.dataTask(with: request, completionHandler: { (data, response, error) in

                    if let error = error {
                        failure(error)
                    } else {
                        let statusCode = router.isSuccessCode(response)
                        if statusCode, let data = data, let response = response {
                            success(data, response)
                        }
                    }
                })
            } catch {
                failure(error)
            }

            self.task?.resume()
        }
    }

    func cancel() {
        self.task?.cancel()
    }
}
