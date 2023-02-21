//
//  NewsCategoryCollectionViewController.swift
//  News
//
//  Created by Максим Зыкин on 21.02.2023.
//

import UIKit


private let reuseIdentifier = "cell"

class NewsCategoryCollectionViewController: UICollectionViewController {

    enum Actions: String, CaseIterable {
        case newsApple = "News mentioning Apple"
        case newsTesla = "News about Tesla"
        case newsSport = "Sports news"
        case newsScience = "Science news"
    }
    
    let actions = Actions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCategoryCollectionViewCell
        let userAction = actions[indexPath.item]
        cell.categoryLabel.text = userAction.rawValue
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case .newsApple:
            performSegue(withIdentifier: "news", sender: self)
        case .newsTesla:
            performSegue(withIdentifier: "tesla", sender: self)
        case .newsSport:
            performSegue(withIdentifier: "sports", sender: self)
        case .newsScience:
            performSegue(withIdentifier: "science", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newsVC = segue.destination as? NewsTableViewController
        
        switch segue.identifier {
        case "news":
            newsVC?.newsAPI = NewsAPI.newsApple
        case "tesla":
            newsVC?.newsAPI = NewsAPI.newsTesla
        case "sports":
            newsVC?.newsAPI = NewsAPI.newsSport
        case "science":
            newsVC?.newsAPI = NewsAPI.science
        default:
            break
        }
    }
}


extension NewsCategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
