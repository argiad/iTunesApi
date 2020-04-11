//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation

public protocol iTunesApiDelegate{
    func error()
    func response(_ response: iTunesResponse)
}
