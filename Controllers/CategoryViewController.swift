//
//  CategoryViewController.swift
//  NewSideProject
//
//  Created by Oniel Rosario on 5/21/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var categories = [CategoryInfo.Category]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        updateCategories()
    }
    
    private func updateCategories() {
        BeerAPIClient.getCategories { (error, categories) in
            if let error = error {
                print(error)
            } else if let categories = categories {
                self.categories = categories
            }
        }
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.row]
        let cache = NSCache<NSString, CategoryInfo.Category>()
        if let cachedObject = cache.object(forKey: "cachedObject") {
             cell.categoryNameLabel.text = cachedObject.name
        } else {
             cell.categoryNameLabel.text = category.name
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        presentViewcontroller(category: category.name)
    }
    
    private func presentViewcontroller(category: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let beersVC = storyboard.instantiateViewController(withIdentifier: "BeersVC") as! MainViewController
        beersVC.category = category
    }
}
