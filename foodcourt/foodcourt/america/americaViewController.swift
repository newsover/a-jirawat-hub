//
//  americaViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class americaViewController: UICollectionViewController {

    @IBOutlet var americaView: UICollectionView!
    var americaMeal: [UIImage] = [UIImage(named: "pancake")!,UIImage(named: "salad")!]
    var americaLabel = ["Pancake","American Tuna Salad"]
    var americaInfo = ["Ingredients \n 1 cup flour \n 2 eggs \n 1 tblespn butter \n 4 spn sugar \n half teaspn baking powder \n half cup milk \n vanilla flavour \n \n https://cookpad.com/us/recipes/6351178-pancake","Ingredients \n 3 Boiled eggs, CD&S (chopped diced & sliced) \n 2 Stalks of celery ,CD&S \n 1 large tomatoes peeled,CD&S \n 1 medium cucumber, CD&S \n 3 dash Sea salt to taste \n 2 dash Coarse black pepper to taste \n 2 cans of tuna in water \n \n https://cookpad.com/us/recipes/339564-bad-teacher-tuna-salad"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.americaView!.register(americaViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return americaMeal.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "americaCell", for: indexPath) as! americaViewCell
        cell.americaImg.image = americaMeal[indexPath.item]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.borderWidth = 2
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.getLabel = americaLabel[indexPath.item]
        vc?.getImage = americaMeal[indexPath.item]
        vc?.getInfo = americaInfo[indexPath.item]
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
