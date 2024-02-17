//
//  Factory.swift
//  
//
//  Created by Ross Viviani on 17/02/2024.
//

import Foundation

public struct Factory {
    
    static func imageURL(data: FlickrPhotoDataModel) -> URL {
        return .init(string: "http://farm\(data.farm).static.flickr.com/\(data.server)/\(data.id)_\(data.secret).jpg")!
    }
}
