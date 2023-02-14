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
    
    /*
    static func dataNews2(news: String, completion: @escaping (ResponseModel1)->()) {
        
        guard let url = URL(string: news) else { return }
        AF.request(url).response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ResponseModel1.self, from: data)
                    let numberList = response.articles.compactMap({ $0.keys })
                    completion(response)

                } catch let error {
                    print(error)
                    
                }
            }
        }
    
     // URLSessiom
    static func dataNews3(news: String, completion: @escaping ([ResponseModel1])->()) {
        guard let yourUrl = URL(string: "https://myUrl") else { return }
        URLSession.shared.dataTask(with: yourUrl) { (data, response , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(ResponseModel1.self, from: data)
                print(data)
            } catch let error {
                print("Err", error)
            }
        }.resume()
    }
     */
}
