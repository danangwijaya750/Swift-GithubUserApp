//
//  DetailUserView.swift
//  Githup App
//
//  Created by Danang Wijaya on 07/05/21.
//

import Foundation
import SwiftUI
import URLImage
struct DetailUserView:View {
    @ObservedObject var viewModel = DetailViewModel()
    let user:UserModel
    var body: some View{
        ZStack{
            VStack{
            URLImage(url: URL(string: user.avatar_url)!){image in
                image.resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
                HStack{
                    Text(user.login).font(.title)
                    Button(action:{
                        if(viewModel.isFav){
                            viewModel.deleteFavourite(userModel: user)
                        }else{
                            viewModel.addFavourite(userModel: user)
                        }
                    }){
                        if(viewModel.isFav){
                            Image(systemName: "bookmark.fill")
                        }else{
                            Image(systemName: "bookmark")
                        }
                    }.padding()
                }
                VStack(alignment: .leading, spacing: 10){
                HStack{
                    Image(systemName: "person")
                    Text(viewModel.res.name ?? "No Name")
                }
                HStack{
                    Image(systemName: "envelope")
                    Text(viewModel.res.email ?? "No Email")
                }
                HStack{
                    Image(systemName: "flag")
                    Text(viewModel.res.company ?? "No Company")
                }
                HStack{
                    Image(systemName: "location")
                    Text(viewModel.res.location ?? "No Address")
                }
                HStack{
                    Image(systemName: "book")
                    Text(viewModel.res.bio ?? "No Bio")
                }
                }.padding()
            Spacer()
            }.onAppear{
                viewModel.getDetail(for: user.login)
                viewModel.checkIsFavourite(userModel: user)
            }
            ProgressView().isHidden(!viewModel.loading)
        }
        
    }
}
