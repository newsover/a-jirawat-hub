//
//  thaiViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class thaiViewController: UICollectionViewController {
    @IBOutlet var thaiView: UICollectionView!
    var thaiMeal: [UIImage] = [UIImage(named: "tomyum")!,UIImage(named: "kraphao")!,UIImage(named: "yumpratoo")!]
    var thaiLabel = ["Tom Yum Khung","Thai Stir Fry Basil","Thai Tuna Salad"]
    var thaiInfo = ["Ingredients \n 300 grams of large shrimps ,peeled and clean \n 2 cup of chicken stock \n 1 stick of lemon grass slices \n 3 slice of galangal \n 3 red thai chilies slices \n 3 shallots cut into half \n 2 bunch of coriander with root \n 1 large tomato cut into 6 pieces \n 1 tbsp of fish sauce \n 1 tbsp of lemon juice1 tbsp of oyster sauce \n 1 tsp of chicken stock powder \n 1/2 cup of coconut cream \n 1 tbsp of sweet chilli paste","Ingredients \n 2-4 guys \n 400 g Beef or Chicken (grounded, minced or diced) \n 100 g Basil Leaves \n [Marinade] \n 1 Tbsp Fish Sauce \n [Paste] - blend or pounded \n 10-20 g Bird's Eye Chilli \n 20 g Garlic \n 40 g Shallots \n [Sauce] \n 1 Tbsp Light Soy Sauce \n 1 Tbsp Dark Soy Sauce \n 1 tsp Oyster Sauce \n Optional, 2 tsp Palm Sugar \n \n https://cookpad.com/us/recipes/2643409-thai-stir-fry-basil-with-beef-pad-bai-horapha","Ingredients \n 1/2 kg of frozen seafood \n 1 large lime cuts into pices removed seed \n 3 choped red chilli \n 1 full hand of salary chopped \n 1 full hand of slices green onions and Pak She \n 1 onion slices \n 1 large tomato slices \n 1 hafe carrot slices. \n 1 tbsp of fish sauce \n 1/2 tsp of chicken stocks powder \n 1 tsp of sugar \n 1 tbsp of garlic pickle juice \n \n https://cookpad.com/us/recipes/360932-thai-seafood-salad"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.thaiView!.register(thaiViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thaiMeal.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thaiCell", for: indexPath) as! thaiViewCell
        cell.thaiImg.image = thaiMeal[indexPath.item]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.borderWidth = 2
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.getLabel = thaiLabel[indexPath.item]
        vc?.getImage = thaiMeal[indexPath.item]
        vc?.getInfo = thaiInfo[indexPath.item]
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
