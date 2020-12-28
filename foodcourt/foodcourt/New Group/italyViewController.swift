//
//  italyViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class italyViewController: UICollectionViewController {
    
    @IBOutlet var italyView: UICollectionView!
    var italyMeal: [UIImage] = [UIImage(named: "pasta")!,UIImage(named: "puff")!,UIImage(named: "roll")!,UIImage(named: "torta")!,UIImage(named: "tuna")!]
    var italyLabel = ["Hot Dog Spegetti","Pizza Puff","Fried Cheese Roll","Spinach Pie","t11una"]
    var italyInfo = ["Ingredients \n 5 servings pasta \n 1 dozen hot dogs \n 1 packages angel hair pastasauce \n 1 jug of ragu \n 1 oregeno \n 1 onion powder \n 1 garlic salt \n 1 parmesean cheese \n 1 black pepper \n \n https://cookpad.com/us/recipes/413569-hot-dog-spegetti","Ingredients\n 6 servings \n 6 puff pastry \n 1 cup pizza or spaghetti sauce \n 1 cup mozzarella or cheddar cheese \n \n https://cookpad.com/us/recipes/336282-pizza-puff---kids-friendly","Ingredients \n 24 pieces \n 250 g phyllo dough cut in medium sized triangles \n 250 g feta cheese, crumbled with a fork \n 200 g mozzarella cheese, grated \n 2 cups vegetable oil, for frying \n 3 tablespoons flour, diluted in 1½ tablespoons water \n 'n https://cookpad.com/us/recipes/4492428-fried-cheese-rolls-rakakat-bi-jibneh","Ingredients \n 1 pie \n Pillsbury Pie Crusts, 2 count \n 1 lb Italian sausage \n 4 eggs \n 10 oz frozen chopped spinach, thawed and drained \n 8 oz mozzarella cheese, shredded (not the pre-shredded kind, we know you were thinking it) \n 1/2 cup 2% milk \n 1 cup 4% cottage cheese \n 1/2 tsp salt \n 1/4 tsp pepper \n 1/3 tsp garlic powder \n Deep dish pie pan (this is a big pie) \n \n https://cookpad.com/us/recipes/1128694-spinach-pie","Ingredients \n 2 servings \n 1 can Tuna \n 2 servings Pasta \n 1 Red onion \n to taste Salt\n to taste Pepper \n 1/2 Pesto \n Garnish: Mozzarella balls, Sundried tomatoes, Grated mozzarella cheese, Rucola \n \n https://cookpad.com/us/recipes/641092-mozzarella-tuna-pasta"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.italyView!.register(ItalyViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return italyMeal.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "italyCell", for: indexPath) as! ItalyViewCell
        cell.italyImg.image = italyMeal[indexPath.item]
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
        vc?.getLabel = italyLabel[indexPath.item]
        vc?.getImage = italyMeal[indexPath.item]
        vc?.getInfo = italyInfo[indexPath.item]
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
