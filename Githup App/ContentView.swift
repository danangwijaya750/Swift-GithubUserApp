//
//  ContentView.swift
//  Githup App
//
//  Created by Danang Wijaya on 29/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Home()
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

struct Home: View{
    var body: some View{
        NavigationView{
            ListContent()
            .navigationTitle("Github User App")
            .navigationBarItems(
                trailing: HStack{
                    Button(action: {print("Search")}){
                        Image(systemName:"magnifyingglass")
                            .foregroundColor(Color.secondary)
                    }
                }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ListContent:View{
    let data:[UserModel] =
        [UserModel(id:1, userName: "danangwijaya750", name: "Danang Wijaya", image: "profile"),
         UserModel(id:2, userName: "pepisudrajat", name: "Pepi Sudrajat", image: "profile"),
         UserModel(id:3, userName: "ahsansuahsan", name: "Ahsan Suahsan", image: "profile")
        ]
    var body: some View{
        List{
            ForEach(data){ it in
                RowContent(data:it)
            }
        }
    }
}

struct UserModel:Identifiable {
    let id:Int
    let userName:String
    let name:String
    let image:String
    init(id:Int,userName:String, name:String,image:String) {
        self.id=id
        self.userName=userName
        self.name=name
        self.image=image
    }
}

struct RowContent :View {
    let data:UserModel
    var body: some View{
        HStack(spacing:20){
            Image(data.image)
                .resizable()
                .frame(width: 80, height: 80, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment:.leading){
                Text(data.name).font(.headline)
                
                Text(data.userName).font(.caption)
            }
        }
    }
}
