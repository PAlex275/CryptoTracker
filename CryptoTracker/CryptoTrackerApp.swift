//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 17.04.2024.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject private var vm = HomeVM()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
