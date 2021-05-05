//
//  ApiServices.swift
//  Githup App
//
//  Created by Danang Wijaya on 03/05/21.
//

import Foundation
import SwiftUI
import Combine
class HomeViewModel: ObservableObject {
    @Published var users=[UserModel]()
    private var task:AnyCancellable?
    
    func getUserHome(){
        guard let url =  URL(string: "https://api.github.com/users")else{return}
        task=URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \HomeViewModel.users, on: self)
        
    }
    
}
