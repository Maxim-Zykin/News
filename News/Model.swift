//
//  Model.swift
//  News
//
//  Created by Максим Зыкин on 13.02.2023.
//

import Foundation
import UIKit

/*
struct ResponseModel1: Codable {
    let status: String
    let totalResults: Int
    let articles: [[String: [News]]]
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults
        case articles = "articles"
    }
    
}
 */

struct Article: Codable {
    let articles: [News]
}

struct News: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    
    init?(json: [String: Any]){

                let author = json["author"] as? String
                let title = json["title"] as? String
                let description = json["description"] as? String
                let url = json["url"] as? String
                let urlToImage = json["urlToImage"] as? String

        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    }
    
    static func getArray(from jsonArray: Any) -> [News]? {
       guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap { News(json: $0) }
    }
    
}

