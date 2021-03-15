//
//  Article.swift
//  SampleApp
//
//  Created by Ryota on 2020/12/23.
//

struct Article {
    
    let title: String
    var userId: String = ""
    let urlString: String
    
    init(json: [String: Any]) {
        
        title = json["title"] as? String ?? ""
        urlString = json["url"] as? String ?? ""
        if let user = json["user"] as? [String: Any] {
            userId = user["id"] as? String ?? ""
        }
    }
}
