# iOSApp3 – Toronto Art Explorer

## Overview

Toronto Art Explorer is a SwiftUI application that allows users to explore Toronto's famous museums and landmarks while viewing artwork from the Metropolitan Museum of Art (MET) API. Users can browse local venues, view detailed information about each location, discover artwork from a live web service, and access additional learning resources.

---

## Features

* Browse popular Toronto venues
* View detailed information for each venue
* Display custom venue images
* Navigate between multiple screens using NavigationStack
* Explore live artwork from the MET Museum API
* Load artwork images using AsyncImage
* Open external learning resources
* Custom dark museum-inspired user interface
* Responsive SwiftUI layout

---

## Technologies Used

* Swift
* SwiftUI
* Xcode
* NavigationStack
* NavigationLink
* Async/Await
* URLSession
* JSONDecoder
* AsyncImage
* List
* VStack
* SF Symbols
* MET Museum Collection API

---

## Project Structure

### Models

* Venue.swift
* Artwork.swift

### Views

* ContentView.swift
* HomeView.swift
* VenueListView.swift
* VenueDetailView.swift
* ArtworkListView.swift
* ArtworkDetailView.swift
* LearningResourcesView.swift

### Services

* APIService.swift

---

## Toronto Venues

### Art Gallery of Ontario (AGO)

* 317 Dundas Street West
* One of Canada's largest art museums.

### Royal Ontario Museum (ROM)

* 100 Queens Park
* Museum featuring art, culture, and natural history.

### Casa Loma

* 1 Austin Terrace
* Historic castle and museum in Toronto.

---

## Learning Objectives

This project demonstrates:

* Building multi-screen SwiftUI applications
* Creating reusable SwiftUI views
* Passing data between views
* Using NavigationStack and NavigationLink
* Consuming a live REST API
* Decoding JSON using Codable
* Loading remote images with AsyncImage
* Using async/await networking
* Creating a custom themed user interface
* Writing organized and well-commented Swift code

---

## API

This project uses the Metropolitan Museum of Art Collection API.

Artwork is downloaded in real time and displayed inside the Artwork Explorer section of the application.

---

## Author

**Matt Comer**

Mobile Web & App Development

TriOS College

June 2026
