//
//  ViewController.swift
//  NewSoloProject
//
//  Created by Oniel Rosario on 5/20/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var allBeers = [Beer.BeerInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     setupCollectionView()
     getBeers()
    }
    
    private func getBeers() {
        BeerAPIClient.getBeers { (error, beer) in
            if let error = error {
                print(error)
            } else if let beer = beer {
                self.allBeers = beer
            }
        }
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allBeers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        let beer = allBeers[indexPath.row]
        cell.textView.text = beer.description
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 354, height: 400)
    }
    
    
}
