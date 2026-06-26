//
//  VenueDetailView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 18 2026
//

import SwiftUI

// Shows details for one venue
struct VenueDetailView: View {

    // Venue passed from the list
    let venue: Venue

    var body: some View {

        ZStack {

            // Charcoal museum background
            LinearGradient(
                colors: [
                    Color(red: 0.08, green: 0.08, blue: 0.09),
                    Color(red: 0.18, green: 0.16, blue: 0.13),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 22) {

                // Venue image
                Image(venue.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .overlay(
                        RoundedRectangle(cornerRadius: 26)
                            .stroke(Color(red: 0.86, green: 0.64, blue: 0.22), lineWidth: 2)
                    )
                    .shadow(radius: 12)
                    .padding(.horizontal)

                // Venue name
                Text(venue.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                // Venue category
                Text(venue.category)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))

                // Venue address
                Text(venue.address)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.7))

                // Venue description
                Text(venue.description)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.85))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 30)
        }
        .navigationTitle(venue.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.black.opacity(0.4), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)    }
}
