//
//  VenueListView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Displays the Toronto venue list screen
struct VenueListView: View {

    // Stores sample Toronto venue data
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

        ZStack {

            // Dark museum background with a subtle green sheen
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.08, blue: 0.07),
                    Color(red: 0.10, green: 0.17, blue: 0.13),
                    Color(red: 0.14, green: 0.13, blue: 0.12),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // Shows all venues in a styled list
            List(venues) { venue in

                // Opens the detail screen for the selected venue
                NavigationLink {
                    VenueDetailView(venue: venue)
                } label: {

                    HStack(spacing: 16) {

                        // Venue thumbnail image
                        Image(venue.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 76, height: 76)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(red: 0.86, green: 0.64, blue: 0.22), lineWidth: 2)
                            )

                        // Venue information
                        VStack(alignment: .leading, spacing: 6) {

                            // Venue name
                            Text(venue.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            // Venue category
                            Text(venue.category)
                                .font(.subheadline)
                                .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))

                            // Venue address
                            Text(venue.address)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.65))
                        }

                        Spacer()
                    }
                    .padding(.vertical, 10)
                }

                // Dark card-style row background
                .listRowBackground(Color(red: 0.14, green: 0.13, blue: 0.12))
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
        .navigationTitle("Toronto Venues")
    }
}

