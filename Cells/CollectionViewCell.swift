//
//  CollectionViewCell.swift
//  NewSoloProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var textviewBG: UIView!
    @IBOutlet weak var berrNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
           commonInit()
    }
    
    func commonInit() {
//        if let image = cellImage {
//            textView.adjustsFontForContentSizeCategory = true
////            let path = UIBezierPath(rect: cellImage.frame)
//            let path = UIBezierPath(roundedRect: image.frame, cornerRadius: 10)
//            textView.textContainer.exclusionPaths = [path]
//               textView.addSubview(image)
//        }
    
    }
    
}
