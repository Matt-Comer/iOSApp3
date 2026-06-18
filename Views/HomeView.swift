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

                // Light background
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 10) {

                    // App title
                    Text("Toronto Art Explorer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 30)

                    // App subtitle
                    Text("Discover local art, culture, and museums")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    // Splash image preview
                    Image("TorontoArtSplash")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        .clipped()
                        .offset(y: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .padding(.horizontal)
                        .padding(.top, -25)
                    
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
                            HomeCard(title: " Learning Resources", icon: "brain.head.profile")
                        }
                        
                        .padding(.top, -10)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

// Reusable home card
struct HomeCard: View {

    // Card title
    let title: String

    // Card icon
    let icon: String

    var body: some View {

        HStack {

            // Card icon
            Image(systemName: icon)
                .font(.title2)

            // Card text
            Text(title)
                .font(.headline)

            Spacer()

            // Arrow icon
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(18)
        .shadow(radius: 3)
        .foregroundStyle(.black)
    }
}
