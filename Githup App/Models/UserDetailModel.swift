//
//  UserDetailModel.swift
//  Githup App
//
//  Created by Danang Wijaya on 21/05/21.
//

import Foundation
struct UserDetailModel:Codable {
    public var login: String = ""
    public var id: Int = 0
    public var nodeID: String? = nil
    public var avatarURL: String = ""
    public var gravatarID: String = ""
    public var url : String = ""
    public var htmlURL : String = ""
    public var followersURL: String = ""
    public var followingURL : String = ""
    public var gistsURL : String = ""
    public var starredURL: String = ""
    public var subscriptionsURL : String = ""
    public var organizationsURL : String = ""
    public var reposURL: String = ""
    public var eventsURL: String = ""
    public var receivedEventsURL: String = ""
    public var type: String = ""
    public var siteAdmin: Bool = false
    public var name: String = ""
    public var company: String? = nil
    public var blog : String = ""
    public var location: String = ""
    public var email : String? = nil
    public var hireable: Bool? = nil
    public var bio: String? = nil
    public var twitterUsername: String? = nil
    public var publicRepos:Int = 0
    public var publicGists:Int = 0
    public var followers: Int = 0
    public var following: Int = 0
    public var createdAt : String = ""
    public var updatedAt: String = ""
    
    enum CodingKeys: String, CodingKey {
            case login, id
            case nodeID = "node_id"
            case avatarURL = "avatar_url"
            case gravatarID = "gravatar_id"
            case url
            case htmlURL = "html_url"
            case followersURL = "followers_url"
            case followingURL = "following_url"
            case gistsURL = "gists_url"
            case starredURL = "starred_url"
            case subscriptionsURL = "subscriptions_url"
            case organizationsURL = "organizations_url"
            case reposURL = "repos_url"
            case eventsURL = "events_url"
            case receivedEventsURL = "received_events_url"
            case type
            case siteAdmin = "site_admin"
            case name, company, blog, location, email, hireable, bio
            case twitterUsername = "twitter_username"
            case publicRepos = "public_repos"
            case publicGists = "public_gists"
            case followers, following
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
}

