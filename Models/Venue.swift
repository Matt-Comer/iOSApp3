//
//  Venue.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import Foundation

// Venue model
struct Venue: Identifiable {
    
    // Unique ID
    let id = UUID()
    
    // Venue name
    let name: String
    
    // Venue address
    let address: String
    
    // Venue description
    let description: String
    
    // Venue image asset name
    let imageName: String
    
    // Venue icon
    let iconName: String
    
    // Short venue type
    let category: String
}
