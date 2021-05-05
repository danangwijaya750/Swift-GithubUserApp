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
    private var task: AnyCancellable?
    @Published var res = SearchResponse(items: [])
    func searchUser(for query:String){
        var url = "https://api.github.com/search/users?q=\(query)"
        task=URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map{$0.data}
            .decode(type:SearchResponse.self, decoder: JSONDecoder())
            .replaceError(with: SearchResponse(items: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ExploreViewModel.res, on: self)
    }
}
