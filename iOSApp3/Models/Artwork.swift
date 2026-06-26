//
//  Artwork.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import Foundation

// Artwork model for MET API results
struct Artwork: Identifiable, Codable {

    // Unique MET object ID
    let objectID: Int

    // Artwork title
    let title: String?

    // Artist name
    let artistDisplayName: String?

    // Small artwork image URL
    let primaryImageSmall: String?

    // Uses MET objectID as SwiftUI list ID
    var id: Int {
        objectID
    }
}
