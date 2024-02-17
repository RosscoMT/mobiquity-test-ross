//
//  DataService.swift
//  Mobiquity Test
//
//  Created by Ross Viviani on 16/02/2024.
//

import Foundation

/// Networking layer used for all communication
public struct DataService {
    
    let buildType: BuildType
    
    public init(buildType: BuildType) {
        self.buildType = buildType
    }
    
    public func dataRequest(request: URL) async -> Result<[FlickrPhotoDataModel], FlickrErrors> {
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: request)
            
            // Process the response code
            switch (response as? HTTPURLResponse)?.statusCode {
            case 200:
                
                // Decode the response using the data models
                if let decodedResponse: FlickrContainer = try? JSONDecoder().decode(FlickrContainer.self, from: data) {
                    return .success(decodedResponse.photos.photo)
                } else {
                    return .failure(.decodingFailure)
                }
            default:
                return .failure(.badRequest)
            }
        } catch {
            return .failure(.connectionError)
        }
    }
    
    /// Simplified method used for composing the request URL for searching for the images
    public func search(phrase: String) -> URL? {
        var url = URL(string: "https://api.flickr.com/services/rest/")
        url?.append(queryItems: [
            .init(name: "method", value: ServiceRequest.photoSearch.rawValue),
            .init(name: "api_key", value: "9d80408986a7af017c5270fd6578d9f5"),
            .init(name: "text", value: phrase),
            .init(name: "nojsoncallback", value: "1"),
            .init(name: "format", value: "json"),
            .init(name: "safe_search", value: "1")
        ])
        return url
    }
}

extension Array where Element == FlickrPhotoDataModel {
    
    public func urlImageRequests() -> [URL] {
        return self.map({ Factory.imageURL(data: $0)})
    }
}

