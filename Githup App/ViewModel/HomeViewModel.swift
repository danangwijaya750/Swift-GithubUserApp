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
    @Published var loading = false
    private var disposeBag = Set<AnyCancellable>()
    init(){
        self.requestUser()
            .handleEvents(receiveSubscription: { _ in
                                DispatchQueue.main.async {
                                    self.loading = true
                                }
                            },
                            receiveCompletion: { comp in
                                DispatchQueue.main.async {
                                    self.loading = false
                                }
                            })
                            .eraseToAnyPublisher()
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to:\.users,on:self)
            .store(in: &disposeBag)
    }

    
    private func requestUser() -> AnyPublisher<[UserModel], Error> {
            guard let url = URL(string: "https://api.github.com/users") else {
                return Fail(error: URLError(.badURL))
                    .mapError { $0 as Error }
                    .eraseToAnyPublisher()
            }
            return URLSession.shared.dataTaskPublisher(for: url)
                   .map { $0.data }
                   .mapError { $0 as Error }
                   .decode(type: [UserModel].self, decoder: JSONDecoder())
                   .eraseToAnyPublisher()
        }
    
}
