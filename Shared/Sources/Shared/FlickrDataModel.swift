//
//  FlickrDataModel.swift
//  
//
//  Created by Ross Viviani on 16/02/2024.
//

import Foundation

public struct FlickrContainer: Decodable {
    public let photos: FlickrPageDataModel
}

public struct FlickrPageDataModel: Decodable {
    public let page: Int
    public let photo: [FlickrPhotoDataModel]
}

public struct FlickrPhotoDataModel: Decodable {
    public let id: String
    public let farm: Int
    public let server: String
    public let secret: String
}
