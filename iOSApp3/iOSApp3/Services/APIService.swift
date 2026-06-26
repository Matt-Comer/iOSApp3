//
//  APIService.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import Foundation

// Handles all network requests for the MET Museum API
class APIService {

    // Gets a list of artwork object IDs from the MET API search endpoint
    func fetchArtworkIDs() async throws -> [Int] {

        // URL for searching paintings that have images
        let urlString = "https://collectionapi.metmuseum.org/public/collection/v1/search?q=painting&hasImages=true"

        // Safely creates a URL from the string
        guard let url = URL(string: urlString) else {
            return []
        }

        // Downloads data from the API
        let (data, _) = try await URLSession.shared.data(from: url)

        // Converts the JSON search result into a Swift model
        let result = try JSONDecoder().decode(ArtworkSearchResult.self, from: data)

        // Returns the list of MET artwork IDs
        return result.objectIDs
    }

    // Gets full details for one artwork using its object ID
    func fetchArtworkDetails(id: Int) async throws -> Artwork {

        // URL for one specific artwork object
        let urlString = "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(id)"

        // Safely creates a URL from the string
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        // Downloads artwork detail data from the API
        let (data, _) = try await URLSession.shared.data(from: url)

        // Converts the JSON artwork data into an Artwork model
        let artwork = try JSONDecoder().decode(Artwork.self, from: data)

        // Returns the finished artwork object
        return artwork
    }
}

// Model used for the MET API search result
struct ArtworkSearchResult: Codable {

    // Array of artwork object IDs returned by the search
    let objectIDs: [Int]
}
