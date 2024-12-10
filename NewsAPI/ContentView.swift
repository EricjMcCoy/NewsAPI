//
//  ContentView.swift
//  NewsAPI
//
//  Created by Eric McCoy (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading"
    var body: some View {
        VStack {
            
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=c371d63994084e1a967dea1634098b64")!

               let (data, _) = try! await URLSession.shared.data(from: url)

               json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
