//
//  ExploreViewModel.swift
//  Githup App
//
//  Created by Danang Wijaya on 05/05/21.
//

import Foundation
import SwiftUI
import Combine
class ExploreViewModel: ObservableObject {
    @Published var res = SearchResponse(items: [])
    @Published var loading = false
    private var disposeBag = Set<AnyCancellable>()
    func searchUser(for query:String){
        self.doSearch(for: query)
            .handleEvents(
                receiveSubscription:{_ in 
                    DispatchQueue.main.async{
                        self.loading=true
                    }
                },
                receiveCompletion: {comp in
                    DispatchQueue.main.async {
                        self.loading=false
                    }
                }).eraseToAnyPublisher()
            .replaceError(with: SearchResponse(items: []))
            .receive(on: DispatchQueue.main)
            .assign(to:\.res, on: self)
            .store(in: &disposeBag)

    }
    func doSearch(for query:String)-> AnyPublisher<SearchResponse, Error> {
        guard let url = URL(string: "https://api.github.com/search/users?q=\(query)") else {
            return Fail(error: URLError(.badURL))
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
               .map { $0.data }
               .mapError { $0 as Error }
               .decode(type:SearchResponse.self, decoder: JSONDecoder())
               .eraseToAnyPublisher()
    }
}
