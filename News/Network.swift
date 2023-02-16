//
//  Network.swift
//  News
//
//  Created by Максим Зыкин on 14.02.2023.
//

import Foundation
import Alamofire

class NetworkNews {
    
    static func dataNews(newsAPI: String, completion: @escaping (_ news: [News])->()) async {

        guard let url = URL(string: newsAPI) else { return }

        let dataTask = AF.request(url)
        let decoded = dataTask.serializingDecodable(Article.self)
        let response = await decoded.response
        let result = response.result
        
        switch result {
        case .success(let value):
            print(value)
            completion(value.articles)
        case .failure(let error):
            print(error)
        }
    }

}

