//
//  britishViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class britishViewController: UICollectionViewController {

    @IBOutlet var britishView: UICollectionView!
    var britishMeal: [UIImage] = [UIImage(named: "eggbenedict")!,UIImage(named: "muffin")!]
    var britishLabel = ["Egg Benedict","Burger Muffins"]
    var britishInfo = ["Ingredients \n Serves two \n 7 eggs or 4 eggs plus 3 pasteurized egg yolks \n 1 Stick and a half of unsalted butter (12 ounces total) \n 4 thin slices of cooked ham or Canadian Bacon \n 2 English Muffins \n 1 Tablespoon lemon juice \n Dash salt \n 1 Teaspoon prepared mustard \n Dash red pepper powder \n 1 Tablespoon hot water \n \n https://cookpad.com/us/recipes/5204721-easy-eggs-benedict","Ingredients \n 1 1/4 lb beef \n 3 tbsp butter \n 12 slice bread \n 1 egg \n 1 can cream of mushroom \n 3/4 cup shredded cheese \n \n https://cookpad.com/us/recipes/377356-hamburger-muffins"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.britishView!.register(britishViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return britishMeal.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "britishCell", for: indexPath) as! britishViewCell
        cell.britishImg.image = britishMeal[indexPath.item]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.borderWidth = 2
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.getLabel = britishLabel[indexPath.item]
        vc?.getImage = britishMeal[indexPath.item]
        vc?.getInfo = britishInfo[indexPath.item]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 1
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderView
        return header
    }
}
