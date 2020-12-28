//
//  ViewController.swift
//  foodcourt
//
//  Created by news on 16/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let countryName = ["Italian","Japanese","Korean","Thai","American","British"]
    let countryImg: [UIImage] = [
    UIImage(named: "italy")!,
    UIImage(named: "japan")!,
    UIImage(named: "korea")!,
    UIImage(named: "thai")!,
    UIImage(named: "us")!,
    UIImage(named: "uk")!,
    ]
    let countryID = ["1","2","3","4","5","6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/3)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell1
        
        cell.imgCountry.image = countryImg[indexPath.item]
        cell.txtCountry.text = countryName[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = collectionView.cellForItem(at: indexPath)
        let _:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboardId = countryID[indexPath.item]
        let segueStoryboard = storyboard?.instantiateViewController(withIdentifier: storyboardId)
    self.navigationController?.pushViewController(segueStoryboard!, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
    }
}

