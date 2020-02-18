//
//  ParameterEncoder.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNIL  = "Parameters were nil."
    case missingPath    = "Path is missing."
    case encodingFailed = "Parameters encoding failed."
    case missingURL     = "URL is nil."
}

protocol ParametersEncoder {
    static func encode(request: inout URLRequest, parameters: Parameters) throws
}
