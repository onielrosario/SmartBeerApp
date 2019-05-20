//
//  BeerAPIClient.swift
//  NewSideProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation



final class BeerAPIClient {
    
    static func getBeers(completionHandler: @escaping(Error?, [Beer.BeerInfo]?) -> Void) {
        let url = "http://api.brewerydb.com/v2/menu/styles/?key=\(Keys.key)"
        guard let getUrl = URL(string: url) else  { return }
        URLSession.shared.dataTask(with: getUrl) { (beers, response, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let beers = beers {
                do {
                   let allBeers = try JSONDecoder().decode(Beer.self, from: beers)
                    completionHandler(nil,allBeers.data)
                } catch {
                    completionHandler(error,nil)
                }
            }
        }.resume()
    }
    
    
    
    
    
}
