//
//  Network.swift
//  News
//
//  Created by Максим Зыкин on 14.02.2023.
//

import Foundation
import Alamofire

class NetworkNews {
    
    static func dataNews(newsAPI: String, completion: @escaping (_ news: [News])->()) {
        
        guard let url = URL(string: newsAPI) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
               var news = [News]()
                news = News.getArray(from: value)!
                completion(news)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
