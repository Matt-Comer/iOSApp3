//
//  VenueListView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Displays venue list
struct VenueListView: View {

    // Sample Toronto venue data
    let venues = [
       
        Venue(
            name: "AGO",
            address: "317 Dundas St W",
            description: "The Art Gallery of Ontario is one of Toronto's major art museums.",
            imageName: "AGOArtSplash",
            iconName: "paintpalette.fill",
            category: "Art Gallery"
        ),
        
        Venue(
            name: "ROM",
            address: "100 Queens Park",
            description: "The Royal Ontario Museum focuses on art, culture, and natural history.",
            imageName: "RomArtSplash",
            iconName: "building.columns.fill",
            category: "Museum"
        ),
        
        Venue(
            name: "Casa Loma",
            address: "1 Austin Terrace",
            description: "Casa Loma is a historic Toronto landmark and museum.",
            imageName: "CasaLomaArtSplash",
            iconName: "house.lodge.fill",
            category: "Historic Castle"
        )
    ]

    var body: some View {

        // Shows all venues in a list
        List(venues) { venue in

            // Opens detail screen for selected venue
            NavigationLink {
                VenueDetailView(venue: venue)
            } label: {
                HStack(spacing: 16) {
                    
                    // Venue icon
                    Image(systemName: venue.iconName)
                        .font(.title2)
                        .foregroundStyle(.blue)
                        .frame(width: 40, height: 40)
                    
                    // Venue text
                    VStack(alignment: .leading, spacing: 4) {
                        
                        // Venue name
                        Text(venue.name)
                            .font(.headline)
                        
                        // Venue category
                        Text(venue.category)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }

        // Screen title
        .navigationTitle("Venues")
    }
}
