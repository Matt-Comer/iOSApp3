//
//  LearningResourcesView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 18, 2026
//

import SwiftUI

// Displays external art and museum learning resources
struct LearningResourcesView: View {

    var body: some View {

        ZStack {

            // Dark museum-style background
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

            // Main list of learning resource cards
            VStack(spacing: 18) {

                // Opens the AGO collection website
                ResourceLinkCard(
                    title: "AGO Collection",
                    subtitle: "Explore works from the Art Gallery of Ontario",
                    icon: "paintpalette.fill",
                    url: "https://ago.ca/collection"
                )

                // Opens the ROM exhibits website
                ResourceLinkCard(
                    title: "ROM Exhibits",
                    subtitle: "View current museum exhibits and collections",
                    icon: "building.columns.fill",
                    url: "https://www.rom.on.ca/whats-on"
                )

                // Opens the City of Toronto public art page
                ResourceLinkCard(
                    title: "Toronto Public Art",
                    subtitle: "Discover public artwork across the city",
                    icon: "map.fill",
                    url: "https://www.toronto.ca/explore-enjoy/history-art-culture/public-art/"
                )

                // Opens the MET Museum API documentation
                ResourceLinkCard(
                    title: "Met Museum API",
                    subtitle: "Live artwork data used in this app",
                    icon: "network",
                    url: "https://metmuseum.github.io/"
                )

                // Pushes cards toward the top of the screen
                Spacer()
            }
            .padding()
            .padding(.top, 20)
        }

        // Screen title
        .navigationTitle("Learning Resources")
        .navigationBarTitleDisplayMode(.inline)

        // Makes the navigation bar readable on the dark background
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.black.opacity(0.4), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

// Reusable card that opens an external website
struct ResourceLinkCard: View {

    // Title shown on the card
    let title: String

    // Short description shown under the title
    let subtitle: String

    // SF Symbol icon shown on the left
    let icon: String

    // Website address opened when the card is tapped
    let url: String

    var body: some View {

        // Opens the website in the browser
        Link(destination: URL(string: url)!) {

            HStack(spacing: 16) {

                // Gold icon for the resource
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))
                    .frame(width: 42, height: 42)

                // Text content for the resource card
                VStack(alignment: .leading, spacing: 5) {

                    // Resource title
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    // Resource subtitle
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.65))
                }

                Spacer()

                // Arrow icon showing the card opens a website
                Image(systemName: "arrow.up.right")
                    .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))
            }
            .padding()

            // Dark card background
            .background(Color(red: 0.14, green: 0.13, blue: 0.12))
            .clipShape(RoundedRectangle(cornerRadius: 22))

            // Subtle border around the card
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
        }
    }
}
