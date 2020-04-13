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
    
    private let internalQueue = DispatchQueue(label: "iTunesApi",
                                              qos: .default,
                                              attributes: .concurrent)
    
    
    private var _delegate: iTunesApiDelegate? = nil
    
    public var delegate: iTunesApiDelegate? {
        get {
            return internalQueue.sync{
                _delegate
            }
        }
        set {
            internalQueue.async(flags: .barrier) {
                self._delegate = newValue
            }
        }
    }

    
    public func search(by request: iTunesSearchRequest) {
        iTunesRequestManager().search(by: request)
    }
    
    
}
