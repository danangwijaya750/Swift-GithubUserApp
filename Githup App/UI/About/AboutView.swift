//
//  AboutView.swift
//  Githup App
//
//  Created by Danang Wijaya on 20/05/21.
//

import Foundation
import SwiftUI
import URLImage
struct AboutView:View {
    
    var body: some View{
        NavigationView{
            ZStack(){
                VStack{
                    URLImage(url: URL(string: "https://lh3.googleusercontent.com/ogw/ADGmqu8P_P8pU-TQbjW5LG8t6ExDhVvW_-fNkwcWHV3-kg=s83-c-mo")!){image in
                        image.resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    Text("Danang Wijaya").font(.title)
                    HStack{
                        Image(systemName: "envelope")
                        Text("danangwijaya750@gmail.com")
                    }
                    HStack{
                        Image(systemName: "phone")
                        Text("+62895391804582")
                    }
                    HStack{
                        Image(systemName: "house")
                        Text("Berbah, Sleman, Yogyakarta")
                    }
                    Spacer()
                }
            }.navigationBarTitle("About")
        }
    }
}

struct AboutView_Preview : PreviewProvider {
    static var previews: some View{
        AboutView()
    }
}
