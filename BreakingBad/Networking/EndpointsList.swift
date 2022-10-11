//
//  EndpointsList.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 11/10/2022.
//

import NetworkManagerSDK

extension Endpoint {
    static let characters = Endpoint(httpMethod: .get, path: "characters", queryItems: [URLQueryItem(name: "limit", value: "16")])
}
