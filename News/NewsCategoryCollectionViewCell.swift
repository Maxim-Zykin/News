//
//  NewsCategoryCollectionViewCell.swift
//  News
//
//  Created by Максим Зыкин on 21.02.2023.
//

import UIKit

class NewsCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var viewCollection: UIView!
    
    func viewDidLoad() {
        viewDidLoad()
        viewCollection.layer.cornerRadius = 10
    }
}
