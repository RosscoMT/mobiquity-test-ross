//
//  FlickrErrors.swift
//
//
//  Created by Ross Viviani on 16/02/2024.
//

import Foundation

public enum FlickrErrors: Error {
    case badRequest
    case connectionError
    case invalidSearchTerm
    case decodingFailure
}
