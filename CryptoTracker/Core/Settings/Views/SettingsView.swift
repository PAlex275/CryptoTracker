//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 24.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let githubURL = URL(string: "https://github.com/PAlex275?tab=repositories")!
    let linkedInURL = URL(string : "https://www.linkedin.com/in/alex-petrisor-30bb1a1b3/")!
    let instagramURL = URL(string: "https://www.instagram.com/p.alex275/")!
    
    var body: some View {
        NavigationStack {
            List {
                linkedInSection
                githubSection
            }
            .tint(.blue)
            .font(.headline)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var linkedInSection: some View{
        Section{
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made using MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("LinkedIn", destination: linkedInURL)
            Link("Instagram", destination: instagramURL)
        }
        header: {
            Text("Alex Petrisor")
        }
    }
    private var githubSection: some View{
        Section{
            VStack(alignment: .leading){
                Image("github")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("You can see all my work on my GitHub profile")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("GitHub", destination: githubURL)
        }
        header: {
            Text("GitHub")
        }
    }
}
