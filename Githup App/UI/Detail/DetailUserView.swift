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
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment:.leading){
                Text(user.login).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(viewModel.res.company ?? "default")
                        .font(.subheadline)
                Text(viewModel.res.createdAt)
            }.padding()
            }.onAppear{
                viewModel.getDetail(for: user.login)
            }
            ProgressView().isHidden(!viewModel.loading)
        }
        
    }
}
