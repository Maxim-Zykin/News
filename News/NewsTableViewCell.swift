//
//  NewsTableViewCell.swift
//  News
//
//  Created by Максим Зыкин on 13.02.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imadeView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with news: News) {
        self.titleLabel.text = news.title
        self.descriptionLabel.text = news.description
        
        DispatchQueue.global().async {
            guard let stringURL = news.urlToImage,
                  let inadeURL = URL(string: stringURL),
                  let imadeData = try? Data(contentsOf: inadeURL)
            else { return }
            
            DispatchQueue.main.async {
                self.imadeView.image = UIImage(data: imadeData)
            }
        }
    }

}
