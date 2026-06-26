//
//  MapView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Map screen
struct MapView: View {

    var body: some View {

        VStack {

            // Map placeholder
            Image(systemName: "map")

                .font(.system(size: 80))

            // Screen text
            Text("Map Coming Soon")
        }

        // Screen title
        .navigationTitle("Map")
    }
}

#Preview {
    MapView()
}
