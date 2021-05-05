//
//  ContentView.swift
//  Githup App
//
//  Created by Danang Wijaya on 29/04/21.
//
import Foundation
import SwiftUI
import URLImage
struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Explore()
                    .tabItem {
                        Image(systemName: "paperplane.fill")
                        Text("Explore")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Bookmark")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


