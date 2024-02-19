//
//  Factory.swift
//  
//
//  Created by Ross Viviani on 17/02/2024.
//

import Foundation

/// Factory methods for quick concise generating of object
public struct Factory {
    
    /// Generate the imageURL using the FlickrPhotoDataModel
    static func imageURL(data: FlickrPhotoDataModel) -> URL {
        return .init(string: "http://farm\(data.farm).static.flickr.com/\(data.server)/\(data.id)_\(data.secret).jpg")!
    }
}
