//
//  BeerModel.swift
//  NewSideProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

struct Beer: Codable {
    struct BeerInfo: Codable {
        let id: Int
        let name : String
        let shortName: String
        let description: String?
        struct BeerCategory: Codable {
            let id: Int
            let name: String
        }
        let category: BeerCategory
    }
    let data: [BeerInfo]
    
}

