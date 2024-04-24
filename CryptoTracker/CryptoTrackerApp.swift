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
    @State private var showLaunchView: Bool = true
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            
            ZStack{
                NavigationView {
                    HomeView()
                        .toolbar(.hidden)
                }
                .environmentObject(vm)
                
                ZStack{
                    if showLaunchView{
                        LaunchView(showLaunchView:  $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
               
            }
          
        }
    }
}
