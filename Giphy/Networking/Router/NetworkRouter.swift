//
//  NetworkRouter.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public typealias NetworkRouterSuccessCompletion = (_ data: Data, _ response: URLResponse) -> ()
public typealias NetworkRouterFailedCompletion = (_ Error: Error) -> ()

protocol NetworkRouter {
    associatedtype requestEndPoint: EndPoint
    func request(_ router: requestEndPoint, success: @escaping NetworkRouterSuccessCompletion,
                 failure: @escaping NetworkRouterFailedCompletion)
    func cancel()
}
