//
//  DetailViewController.swift
//  foodcourt
//
//  Created by news on 17/12/2561 BE.
//  Copyright © 2561 jirawat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelView: UILabel!
    var getLabel = String()
    var getInfo = String()
    var getImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 10
        textView.isSelectable = true
        textView.isEditable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        imgView.image = getImage
        labelView.text! = getLabel
        textView.text! = getInfo
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
