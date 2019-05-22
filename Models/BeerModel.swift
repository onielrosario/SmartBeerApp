//
//  BeerModel.swift
//  NewSideProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

class Beer: Codable {
    class BeerInfo: Codable {
        let id: String
        let name: String
        let abv: String?
        class Label:Codable {
            let icon: String
            let large: String
        }
        let labels: Label?
        struct Style:Codable {
            struct BeerCategory: Codable {
                let id: Int
                let name: String
            }
            let category: BeerCategory
             let description: String?
            let shortName: String
        }
        let style: Style?
    }
    let data: [BeerInfo]
    
}

