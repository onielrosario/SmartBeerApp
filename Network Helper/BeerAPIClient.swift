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
    
    
    static func getCategories(completionHandler: @escaping(Error?, [CategoryInfo.Category]?) -> Void) {
        guard let url = URL(string: "http://api.brewerydb.com/v2/categories/?key=\(Keys.key)") else {
            return 
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
               completionHandler(error,nil)
            } else if let data = data {
                do {
                    let categoryInfo = try JSONDecoder().decode(CategoryInfo.self, from: data)
                    completionHandler(nil, categoryInfo.data)
                } catch {
                    completionHandler(error,nil)
                }
            }
        }.resume()
    }
    
    static func getBeersFromCategory(category: String, completionHandler: @escaping(Error?, [Beer.BeerInfo]?) -> Void) {
        guard let url = URL(string: "http://api.brewerydb.com/v2/beers/?key=\(Keys.key)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                     let allBeers = try JSONDecoder().decode(Beer.self, from: data)
                    completionHandler(nil,allBeers.data.filter{$0.style?.category.name == category})
                } catch {
                    completionHandler(error,nil)
                }
            }
        }.resume()
    }
}
