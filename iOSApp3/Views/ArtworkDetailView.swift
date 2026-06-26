//
//  ArtworkDetailView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 18, 2026
//

import SwiftUI

// Shows details for one artwork from the MET API
struct ArtworkDetailView: View {

    // Artwork passed from ArtworkListView
    let artwork: Artwork

    var body: some View {

        ZStack {

            // Dark museum background
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.08, blue: 0.07),
                    Color(red: 0.10, green: 0.17, blue: 0.13),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {

                // Artwork image from the MET API
                AsyncImage(url: URL(string: artwork.primaryImageSmall ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxHeight: 360)
                .padding()
                .background(Color(red: 0.14, green: 0.13, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 24))

                // Artwork title
                Text(artwork.title ?? "Untitled")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Artist name
                Text((artwork.artistDisplayName ?? "").isEmpty ? "Unknown Artist" : artwork.artistDisplayName!)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))

                // MET object ID
                Text("MET Object ID: \(artwork.objectID)")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.65))

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Artwork Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.black.opacity(0.4), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
