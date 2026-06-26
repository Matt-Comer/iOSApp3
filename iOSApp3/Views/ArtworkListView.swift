//
//  ArtworkListView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 18, 2026
//

import SwiftUI

// Displays artwork from the MET Museum API
struct ArtworkListView: View {

    // Stores downloaded artwork
    @State private var artworks: [Artwork] = []

    // Tracks loading state while the API is downloading
    @State private var isLoading = true

    // API service
    let apiService = APIService()

    var body: some View {

        ZStack {

            // Dark museum background with green sheen
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

            if isLoading {

                // Loading message while artwork downloads
                VStack(spacing: 16) {
                    ProgressView()

                    Text("Loading MET artwork...")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.75))
                }

            } else {

                // Shows downloaded artwork in a list
                List(artworks) { artwork in

                    VStack(alignment: .leading, spacing: 12) {

                        // Artwork image from API
                        AsyncImage(url: URL(string: artwork.primaryImageSmall ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 240)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                        // Artwork title
                        Text(artwork.title ?? "Untitled")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .lineLimit(2)

                        // Artist name
                        Text((artwork.artistDisplayName ?? "").isEmpty ? "Unknown Artist" : artwork.artistDisplayName!)
                            .font(.subheadline)
                            .foregroundStyle(Color(red: 0.86, green: 0.64, blue: 0.22))
                    }
                    .padding()
                    .background(Color(red: 0.14, green: 0.13, blue: 0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
            }
        }
        .navigationTitle("Artwork Explorer")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.black.opacity(0.4), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)

        // Loads artwork when the screen opens
        .task {
            await loadArtwork()
        }
    }

    // Downloads artwork from the MET API
    func loadArtwork() async {

        do {
            // Gets artwork IDs from the API
            let ids = try await apiService.fetchArtworkIDs()

            // Stores artwork objects after they load
            var loadedArtwork: [Artwork] = []

            // Downloads the first ten artwork records
            for id in ids.prefix(10) {

                let artwork = try await apiService.fetchArtworkDetails(id: id)

                // Only displays artwork that has an image
                if !(artwork.primaryImageSmall ?? "").isEmpty {
                    loadedArtwork.append(artwork)
                }
            }

            // Updates the screen with downloaded artwork
            artworks = loadedArtwork
            isLoading = false

        } catch {
            // Prints any API error
            print(error)
            isLoading = false
        }
    }
}
