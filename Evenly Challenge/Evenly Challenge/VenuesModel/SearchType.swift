//
//  SearchType.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import Foundation

public enum SearchType {
    case categories
    case venues(category: String)
    case none
}
