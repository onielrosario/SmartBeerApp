//
//  CollectionViewCell.swift
//  NewSoloProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var textviewBG: UIView!
    @IBOutlet weak var berrNameLabel: UILabel!
    @IBOutlet weak var beerLabel: UIImageView!
    
    func updateCell(beer: Beer.BeerInfo) {
       berrNameLabel.text = beer.style?.shortName
       textView.text = beer.style?.description
    beerLabel.kf.setImage(with: URL(string: beer.labels?.large ?? "no image"), placeholder:#imageLiteral(resourceName: "generic-beer-label.png") )
    }
}
