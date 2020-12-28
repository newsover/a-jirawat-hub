//
//  koreaViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class koreaViewController: UICollectionViewController {

    @IBOutlet var koreaView: UICollectionView!
    var koreaMeal: [UIImage] = [UIImage(named: "chicken")!,UIImage(named: "gimjipork")!,UIImage(named: "kormoo")!]
    var koreaLabel = ["Korean Chicken","Pork and Kimchi","Pork Bulgogi"]
    var koreaInfo = ["Ingredients \n 8-12 servings \n 8-12 chicken thighs with bone \n 5 tbs chili oil \n 3 tsp chili powder \n 3 tbs sesame oil \n 6 tbs soy sauce \n 5 tbs sugar (white) \n 1/4 cup ginger freshly grated \n 3-4 cloves garlic minced \n \n https://cookpad.com/us/recipes/4615066-korean-chicken","Ingredients \n 2 to 3 servings \n 1 Tablespoon oil \n 1 pound pork shoulder or belly, cut into thin slices (1/8 to 1/4 inch thick) \n 1/4 teaspoon salt \n 1/2 a small onion, cut into 1/4-inch strips vertically \n 2 cups ripe kimchi, lightly drained and cut into 1/2-inch strips (I just bunch it all together and cut) \n 1 Tablespoon gochujang (Korean red chili paste) to start \n 1 Tablespoon soy sauce to start \n 2-3 Tablespoons sugar depending on how sweet you like things \n 3/4-1 cup water, depending on how thick or thin you like the sauce \n 400 grams dduk aka Korean Rice Ovalettes that are tube shaped (not the diagonally cut flat ones) \n \n https://cookpad.com/us/recipes/1744443-ddukbokki-with-pork-kimchi","Ingredients \n 1/2 lb pork slices \n 1 cup kimchi \n 1/4 of a sweet onion, chopped \n 2 green onions, cut into 1/3 \n ~~Marinade~~ \n 1 cup Korean BBQ sauce for chicken & pork \n 1/2 Tbs rice sine \n 1 Tbs soy sauce \n 1 Tbs water \n optional Korean hot pepper sauce \n \n https://cookpad.com/us/recipes/3349228-korean-cuisine-pork-bulgogi"]
    override func viewDidLoad() {
        super.viewDidLoad()

            self.koreaView!.register(koreaViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return koreaMeal.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "koreaCell", for: indexPath) as! koreaViewCell
            cell.koreaImg.image = koreaMeal[indexPath.item]
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.borderWidth = 1

            return cell
        }
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.darkGray.cgColor
            cell?.layer.borderWidth = 2
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc?.getLabel = koreaLabel[indexPath.item]
            vc?.getImage = koreaMeal[indexPath.item]
            vc?.getInfo = koreaInfo[indexPath.item]
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
