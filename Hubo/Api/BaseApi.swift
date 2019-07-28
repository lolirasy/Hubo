//
//  BaseApi.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case post
    case get
    case put

    var value: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
}

enum MusicApi {
    case artist
    case album
    case track
    case geners
    case playlists
    case stations
    case editorialPosts
    case tag
    case search
    case versions
    case user

    var httpMethod: HTTPMethod {
        return .get
    }

}

struct BaseApi {

    let baseURL = ""
    let endPoint = ""
    let params = ""
    let authToken = ""

}


