//
//  japanViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class japanViewController: UICollectionViewController {

    @IBOutlet var japanView: UICollectionView!
    var japanMeal: [UIImage] = [UIImage(named: "curry")!,UIImage(named: "eggroll")!,UIImage(named: "yakiniku")!,UIImage(named: "teriyaki")!]
    var japanLabel = ["Japanese Curry with Chicken","Tamagoyaki","Yakiniku Don","Teriyaki Chicken"]
    var japanInfo = ["Ingredients \n 1 carrot (small) \n 1/2 onion (medium) \n 1-2 chicken filet \n 1 potato \n 1 chili \n 3-4 garlic \n 1 pack S&B curry sauce mix \n \n https://cookpad.com/us/recipes/5877808-japanese-curry-chicken","Ingredients \n 3 servings \n 5 Egg \n 1/2 tsp Salt \n 1 tsp Mirin \n 1/2 tsp Soy Sauce \n 2 1/2 tsp Sugar \n 1 Oil for cooking \n \n https://cookpad.com/us/recipes/378538-tamagoyaki-japanese-omelette","Ingredients \n 4 servings \n Freshly Cooked Rice 4 servings \n 300 tot 400g Thinly Sliced Beef \n 1 tablespoon Soy Sauce \n 1 clove Garlic *grated \n 1 small piece Ginger *grated \n 1 tablespoon Oil \n 5-6 leaves Cabbage \n 1 Carrot \n 1 Onion \n 1/2-1 Capsicum \n 3 tablespoons Soy Sauce \n 2 tablespoons Mirin \n \n https://cookpad.com/us/recipes/5723232-yakiniku-don","Ingredients /n 4 servings /n 2 Pieces Chicken thighs /n 100 Grams Cabbage /n 2 tbsp Say Sauce /n 2 tbsp Mirin /n 1 tbsp Salad Oil (Fried Oil) /n /n https://cookpad.com/us/recipes/531292-teriyaki-chicken"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.japanView!.register(japanViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return japanMeal.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "japanCell", for: indexPath) as! japanViewCell
        cell.japanImg.image = japanMeal[indexPath.item]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        // Configure the cell
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.borderWidth = 2
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.getLabel = japanLabel[indexPath.item]
        vc?.getImage = japanMeal[indexPath.item]
        vc?.getInfo = japanInfo[indexPath.item]
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
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
