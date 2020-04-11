//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation

internal enum ParameterKey: String, RawRepresentable {
    case term
    case country
    case media
    case entity
    case attribute
    case limit
    case lang
    case version
    case explicit
}


public enum MediaType: String, RawRepresentable {
    
    case movie
    case podcast
    case music
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case software
    case ebook
    case all

    public var name: String {
        let pattern = "([a-z?])([A-Z])"
        
        if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
            let range = NSRange(location: 0, length: self.rawValue.count)
            return regex.stringByReplacingMatches(in: self.rawValue, options: [], range: range, withTemplate: "$1 $2").capitalized
        }
        return ""
    }

    init?(name: String) {
        
        let rawScope = name.firstLowercased.replacingOccurrences(of: " ", with: "")

        if let media = MediaType(rawValue: rawScope) {
            self = media
        } else {
            return nil
        }
    }
}



