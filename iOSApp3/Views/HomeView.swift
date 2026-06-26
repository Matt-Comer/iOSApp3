//
//  HomeView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Main home screen
struct HomeView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                // Dark museum background with green sheen
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

                VStack(spacing: 18) {

                    // App title
                    Text("Toronto Art Explorer")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 30)

                    // App subtitle
                    Text("Discover local art, culture, and museums")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.8))

                    // Splash image preview
                    Image("TorontoArtSplash")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 230)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color(red: 0.86, green: 0.64, blue: 0.22), lineWidth: 1.5)
                        )
                        .shadow(radius: 12)
                        .padding(.horizontal)

                    // Menu cards
                    VStack(spacing: 16) {

                        NavigationLink {
                            VenueListView()
                        } label: {
                            HomeCard(title: "Local Toronto Venues", icon: "building.columns")
                        }

                        NavigationLink {
                            ArtworkListView()
                        } label: {
                            HomeCard(title: "Artwork Explorer", icon: "paintpalette")
                        }

                        NavigationLink {
                            LearningResourcesView()
                        } label: {
                            HomeCard(title: "Learning Resources", icon: "brain.head.profile")
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

// Reusable home card for main navigation buttons
struct HomeCard: View {

    // Card title shown to the user
    let title: String

    // SF Symbol icon name for the card
    let icon: String

    var body: some View {

        HStack {

            // Gold card icon
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))

            // White card title text
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Spacer()

            // Gold arrow showing the row is tappable
            Image(systemName: "chevron.right")
                .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.14, green: 0.13, blue: 0.12))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(red: 0.86, green: 0.64, blue: 0.22), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.35), radius: 8, x: 0, y: 4)
    }
}
