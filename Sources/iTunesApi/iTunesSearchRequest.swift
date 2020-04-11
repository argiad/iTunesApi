//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation

public struct iTunesSearchRequest {
    
    var term: String
    var mediaType: String
    var limit: String
    var countryCode: String
    
    public var parameters: [URLQueryItem] {
        return [
            URLQueryItem(name: ParameterKey.term.rawValue, value: term),
            URLQueryItem(name: ParameterKey.country.rawValue, value: countryCode),
            URLQueryItem(name: ParameterKey.media.rawValue, value: mediaType),
            URLQueryItem(name: ParameterKey.limit.rawValue, value: limit)
        ]
    }
    
    public init?(term: String,
                 mediaType: MediaType = .all,
                 limit: Int = 50,
                 countryCode: String = Locale.current.regionCode ?? "US") {
        
        guard term.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false,
            let termQuery = term
                .replacingOccurrences(of: " ", with: "+")
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                    return nil
        }
        
        self.term = termQuery
        self.mediaType = mediaType.rawValue
        self.limit = (1...200 ~= limit) ? "\(limit)" : "50"
        self.countryCode = countryCode
    }
    
    
}
