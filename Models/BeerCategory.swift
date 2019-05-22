//
//  BeerCategory.swift
//  NewSideProject
//
//  Created by Oniel Rosario on 5/21/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

class CategoryInfo: Codable {
    class Category: Codable {
        let id: Int
        let name: String
    }
    let data: [Category]
}


