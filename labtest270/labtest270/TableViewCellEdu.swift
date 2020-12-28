//
//  TableViewCellEdu.swift
//  labtest270
//
//  Created by Student on 7/11/2561 BE.
//  Copyright © 2561 Student. All rights reserved.
//

import UIKit

class TableViewCellEdu: UITableViewCell {
    @IBOutlet weak var imgSchool: UIImageView!
    @IBOutlet weak var txtSchool: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
