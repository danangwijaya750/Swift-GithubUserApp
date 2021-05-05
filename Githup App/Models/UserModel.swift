//
//  UserModel.swift
//  Githup App
//
//  Created by Danang Wijaya on 03/05/21.
//

import Foundation
import SwiftUI

struct UserModel : Codable, Identifiable {
    public var id:Int
    public var login: String
    public var node_id : String
    public var avatar_url : String
    public var gravatar_id: String
    public var url: String
    public var html_url : String
    public var followers_url: String
    public var following_url: String
    public var gists_url: String
    public var starred_url: String
    public var subscriptions_url: String
    public var organizations_url: String
    public var repos_url: String
    public var events_url: String
    public var received_events_url: String
    public var type: String
    public var site_admin: Bool
}

struct SearchResponse:Codable{
    public var items : [UserModel]
}
