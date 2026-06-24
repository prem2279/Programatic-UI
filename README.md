# Programatic UI
 
A hands-on iOS playground for building **UIKit interfaces entirely in code** — no Storyboards, no XIBs, just `UIView`, Auto Layout, and Swift. The app is organized as a single hub screen whose button grid links out to a collection of small, self-contained demos, each one focused on a different iOS concept.
 
> Written 100% in Swift, targeting UIKit with the `UIScene` lifecycle (iOS 13+).
 
---
 
## Table of Contents
 
- [Overview](#overview)
- [Demo Modules](#demo-modules)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Testing](#testing)
- [Key Concepts Demonstrated](#key-concepts-demonstrated)
- [Author](#author)
---
 
## Overview
 
The app boots straight into `FirstController` (wrapped in a `UINavigationController`, configured in `SceneDelegate` — there is no main storyboard). `FirstController` presents a 3×3 grid of buttons; each button pushes a different demo view controller onto the navigation stack. Every screen is laid out programmatically using `NSLayoutConstraint`, `UIStackView`, and a set of reusable Auto Layout helper functions.
 
The goal of the project is practice and reference: it collects common UIKit patterns (table views, collection views, custom cells, networking, scroll views, GCD) into one place, each implemented from scratch in code.
 
## Demo Modules
 
| Button | Screen | What it demonstrates |
| ------ | ------ | -------------------- |
| **Color** | `RandomColorCollectionViewController` | `UICollectionView` with a flow layout, randomly colored cells, and variable item sizes via `UICollectionViewDelegateFlowLayout`. |
| **Cars** | `CarsCollectionViewController` | Multi-**section** collection view with section headers (supplementary views) and SF Symbols, driven by a `Catogory` model. |
| **Spotify** | `SpotifyTableViewController` | `UITableView` with a custom `SpotifyTableViewCell`, protocol-driven data loading, and swappable real/mock data sources. |
| **Profile** | `ProfileController` | A profile "card" built with nested stack views, stat cards, a profile image, and a scrollable column of constraints. |
| **Second** | `SecondController` | A button grid assembled purely from nested horizontal/vertical `UIStackView`s. |
| **Movie** | `MoviesDashboardController` → `MovieDetailsController` | Fetches live data from a REST API, renders it in a table, and pushes a detail screen built with a `UIScrollView` + content view. |
| **Download** | `DownloadViewController` | Background work with Grand Central Dispatch (`DispatchQueue.global()` → `.main`) and live label updates. |
 
> The Movies dashboard fetches from the public [DummyJSON](https://dummyjson.com) API and maps generic product fields onto a `Movie` model via custom `CodingKeys` — a neat trick for demoing JSON decoding without a dedicated backend.
 
## Architecture
 
The codebase leans on a few small, focused abstractions to keep view controllers clean:
 
- **`UIElements`** — a factory struct with static helpers (`button`, `label`, `imageView`) so UI elements are created consistently with sensible defaults (`translatesAutoresizingMaskIntoConstraints = false` is handled for you).
- **`ConstraintsHelper`** — free functions that wrap common Auto Layout patterns: `pinAllCorners`, `pinLeftRightCorners`, `pinTopToBottomCorner`, `centerX`, `setWidthHeightConstraints`, and more. These keep constraint code short and readable across every screen.
- **Networking layer** — a `NetworkProtocol` is implemented by both a real `NetworkManager` (singleton, uses `URLSession`) and a `MockNetworkManager` (returns local mock data). Screens flip between them with a simple `isInternetAvailable` flag, making the UI testable offline.
- **Models** (`Modal/`) — `Movie`/`Product` (`Decodable`), `Song`, and `Catogory`.
- **Constants** — enums for cell reuse identifiers (`TableViewCells`, `CollectionViewCells`) and layout values (`Constraints`).
- **`Common/`** — standalone, UI-free business-logic types (`Calculator`, `Circle`, `LoginValidator`, `MoviesFilter`, `ShoppingCart`, `TodoManager`, `greetUser`) that exist primarily to be exercised by the unit tests.
## Project Structure
 
```
Programatic UI/
├── AppDelegate.swift
├── SceneDelegate.swift            # Sets FirstController as the root (no storyboard)
├── Common/                        # Pure logic, unit-tested
│   ├── Calculator.swift
│   ├── Circle.swift
│   ├── Greeting.swift
│   ├── LoginValidator.swift
│   ├── MovieFilter.swift
│   ├── ShoppingCart.swift
│   └── ToDoList.swift
├── Constants/
│   ├── Cells.swift                # Reuse identifiers
│   └── Constraints.swift
├── Controller/
│   ├── FirstController.swift      # Hub screen (button grid)
│   ├── SecondController.swift
│   ├── ProfileController.swift
│   ├── ProfileController+Components.swift
│   ├── MoviesDashboardController.swift
│   ├── MovieDetailsController.swift
│   ├── SpotifyTableViewController.swift
│   ├── RandomColorCollectionViewController.swift
│   ├── CarsCollectionViewController.swift
│   ├── DownloadViewController.swift
│   └── Extension/UIColor.swift    # `UIColor.random`
├── Modal/                         # Data models
│   ├── MovieModal.swift
│   ├── SpotifyModal.swift
│   └── IconsModal.swift
├── MockData/
│   ├── MoviesMockData.swift
│   └── SpotifyMockData.swift
├── NetworkManager/
│   ├── NetworkManager.swift
│   └── Debug/MockNetworkManager.swift
├── Util/
│   ├── UIElements.swift           # UI factory
│   └── ConstraintsHelper.swift    # Auto Layout helpers
└── Views/
    ├── TableCells/
    │   ├── MovieCell.swift
    │   └── SpotifyTableViewCell.swift
    └── CollectionCells/
        ├── CarCollectionViewCell.swift
        └── RandomColorCollectionViewCell.swift
 
Programatic UITests/               # Unit tests (XCTest)
├── LoginTestCases.swift
├── MovieFilterTestCases.swift
└── ShoppingCartTestCases.swift
 
Programatic UIUITests/             # UI test targets
```
 
## Tech Stack
 
- **Language:** Swift 5.0
- **UI framework:** UIKit (programmatic Auto Layout, `UIScene` lifecycle)
- **Networking:** `URLSession`
- **Concurrency:** Grand Central Dispatch (GCD)
- **Testing:** XCTest
- **Tooling:** Xcode
## Getting Started
 
### Prerequisites
 
- macOS with [Xcode](https://developer.apple.com/xcode/) installed
- An iOS Simulator or a physical iOS device
### Run it
 
1. Clone the repository:
```bash
   git clone https://github.com/prem2279/Programatic-UI.git
```
2. Open the project in Xcode:
```bash
   cd Programatic-UI
   open "Programatic UI.xcodeproj"
```
3. Select an iOS Simulator (or your connected device) from the scheme selector.
4. Press **⌘R** to build and run.
From the first screen, tap any button to explore the corresponding demo.
 
## Testing
 
The project ships with a set of XCTest unit tests covering the logic types in `Common/`:
 
- **`LoginTestCases`** — email and password validation rules
- **`MovieFilterTestCases`** — filtering movies by genre, rating, and year
- **`ShoppingCartTestCases`** — subtotal, tax, total, and cart-clearing math
Run the full suite from Xcode with **⌘U**, or test a single file from the test navigator.
 
## Key Concepts Demonstrated
 
- Building UIKit screens 100% in code (no Storyboards beyond the launch screen)
- Programmatic Auto Layout with anchors, stack views, and reusable constraint helpers
- `UITableView` and `UICollectionView` with custom cells, sections, and headers
- Protocol-oriented design with swappable real/mock implementations
- JSON decoding with `Decodable` and custom `CodingKeys`
- Asynchronous networking and background work with `URLSession` + GCD
- Singleton and factory patterns
- Unit testing with XCTest
## Author
 
**Prem G** — [@prem2279](https://github.com/prem2279)
