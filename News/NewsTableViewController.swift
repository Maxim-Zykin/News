//
//  NewsTableViewController.swift
//  News
//
//  Created by Максим Зыкин on 13.02.2023.
//

import UIKit

class NewsTableViewController: UITableViewController {

    let url = "https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=377c14cfbdd24dab93f00f8efa5c7ebc"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    var news = [News]()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        let news = news[indexPath.row]
        cell.configure(with: news)

        return cell
    }
  
    func fetchData() {
        NetworkNews.dataNews(newsAPI: url) { news in
            self.news = news
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
