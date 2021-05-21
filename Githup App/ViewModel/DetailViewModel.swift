//
//  DetailViewModel.swift
//  Githup App
//
//  Created by Danang Wijaya on 20/05/21.
//

import Foundation
import SwiftUI
import Combine
class DetailViewModel:ObservableObject {
    @Published var res = UserDetailModel()
    private var disposeBag = Set<AnyCancellable>()
    @Published var loading=false
    func getDetail(for login:String){
        print(login)
        self.doGetDetail(for: login)
            .handleEvents(receiveSubscription:{_ in
                DispatchQueue.main.async {
                    self.loading=true
                }
            }, receiveCompletion:{complete in
                DispatchQueue.main.async {
                    self.loading=false
                }
            } )
            .eraseToAnyPublisher()
            .replaceError(with: UserDetailModel())
            .receive(on:DispatchQueue.main)
            .assign(to:\.res,on:self)
            .store(in: &disposeBag)
        
    }
    func doGetDetail(for login:String)->AnyPublisher<UserDetailModel,Error>{
        guard let url = URL(string: "https://api.github.com/users/\(login)") else {
            print("error :\(URLError(.badServerResponse))")
            return Fail(error: URLError(.badURL))
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
               .map {data, res in
                return try! JSONDecoder().decode(UserDetailModel.self,from: data)
               }
               .mapError { $0 as Error}
               .eraseToAnyPublisher()
    }
}
