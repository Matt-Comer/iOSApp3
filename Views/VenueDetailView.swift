//
//  VenueDetailView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Shows details for one venue
struct VenueDetailView: View {

    // Venue passed from the list
    let venue: Venue

    var body: some View {

        VStack(spacing: 24) {

            // Venue image
            Image(venue.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 260)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .padding(.horizontal)

            // Venue name
            Text(venue.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            // Venue address
            Text(venue.address)
                .font(.title3)
                .foregroundStyle(.secondary)

            // Venue description
            Text(venue.description)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 32)

            Spacer()
        }
        .padding(.top, 40)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

