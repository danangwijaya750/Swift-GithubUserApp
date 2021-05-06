//
//  HomeView.swift
//  Githup App
//
//  Created by Danang Wijaya on 05/05/21.
//

import Foundation
import SwiftUI
import URLImage

struct Home: View{
    var body: some View{
        NavigationView{
            ListContent()
            .navigationTitle("Github User App")
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ListContent:View{
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View{
        List(viewModel.users){it in
            NavigationLink(destination: DetailUserView(user: it)){
                RowContent(data:it)
            }
        }
        .onAppear{
            self.viewModel.getUserHome()
        }
    }
}


struct RowContent :View {
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
