//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation

public class iTunesApi {

    // init singelton
    public static let shared = iTunesApi()
    private init() { }
    
    // callback delegate
    public var delegate: iTunesApiDelegate? = nil

    
    public func search(by request: iTunesSearchRequest) {
        iTunesRequestManager().search(by: request)
    }
    
    
}
