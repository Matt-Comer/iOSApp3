//
//  LaunchScreenView.swift
//  iOSApp3
//
//  Created by Matt Comer
//  Date: June 17, 2026
//

import SwiftUI

// Launch screen
struct LaunchScreenView: View {

    var body: some View {

        VStack {

            // App icon
            Image(systemName: "paintpalette.fill")

                .font(.system(size: 80))

            // App title
            Text("Toronto Art Explorer")

                .font(.title)

                .bold()
        }
    }
}

#Preview {
    LaunchScreenView()
}
