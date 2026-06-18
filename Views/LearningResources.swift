//
//  LearningResourcesView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 18, 2026
//

import SwiftUI

// Displays art learning resources
struct LearningResourcesView: View {

    // Sample resource list
    let resources = [
        "AGO Collection",
        "ROM Exhibits",
        "Toronto Public Art",
        "Met Museum API"
    ]

    var body: some View {

        List(resources, id: \.self) { resource in

            // Display resource name
            Text(resource)
        }

        // Screen title
        .navigationTitle("Learning Resources")
    }
}
