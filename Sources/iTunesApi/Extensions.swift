//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation

extension String {
    var firstLowercased: String { prefix(1).lowercased() + dropFirst() }
}
