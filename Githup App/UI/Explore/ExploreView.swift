//
//  ExploreView.swift
//  Githup App
//
//  Created by Danang Wijaya on 05/05/21.
//

import Foundation
import SwiftUI
import URLImage

struct Explore:View {
    @State var query=""
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View{
        NavigationView{
            VStack{
                SearchBar(text: $query,onTextChanged: searchUser)
                SearchContent(users:viewModel.res.items)
            }
            .navigationTitle("Explore")
           
        }
    }
    func searchUser(for search:String) {
        if !search.isEmpty{
            viewModel.searchUser(for: search)
        }
    }
}

struct SearchContent:View {
    let users:[UserModel]
    var body: some View{
        List(users){it in
            SearchRow(data:it)
        }
    }
}

struct SearchRow:View {
    let data:UserModel
    var body: some View{
        HStack(spacing:20){
            URLImage(url: URL(string: data.avatar_url)!) { image in
                image.resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment:.leading){
                Text(data.login).font(.headline)
                
                Text(data.repos_url).font(.caption)
            }
        }
    }
}
