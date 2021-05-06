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
    let user:UserModel
    var body: some View{
        VStack{
            URLImage(url: URL(string: user.avatar_url)!){image in
                image.resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment:.leading){
                Text(user.login).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(user.organizations_url)
                        .font(.subheadline)
                    Text(user.repos_url)
            }.padding()
        }.edgesIgnoringSafeArea(.top)
    }
}

