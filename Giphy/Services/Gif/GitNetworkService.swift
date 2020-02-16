//
//  GitNetworkService.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

/**public class SpeciesNetworkService: NetworkService, SpeciesUseCases {

    public func listSpecies(_ input: Species.List.Input,
                            completion: @escaping (Result<Species.List.Output, NetworkError>) -> Void) {
        let request = SpeciesRouter.listSpecies(input)
        client.request(request, completion: completion)
    }

    public func speciesDetails(_ input: Species.Details.Input,
                               completion: @escaping (Result<Species.Details.Output, NetworkError>) -> Void) {
        let request = SpeciesRouter.speciesDetails(input)
        client.request(request, completion: completion)
    }
}
*/


public class GifNetworkService {

    public func listTrendingPosts(completion: @escaping(Data?, Error?) -> Void) {
        let path = "trending"
        let parameters = ["api_key": "1L9rTdIySwunODKuMPXO26SyDkyjm6Cj",
                          "limit": "20",
                          "offset": "25",
                          "rating": "pg"]
        let trendingPostsEndPoint = EndPoint(path: path, parameters: parameters, method: .get)

        Router.shared.request(trendingPostsEndPoint, success: { (data, response) in
            completion(data, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}
