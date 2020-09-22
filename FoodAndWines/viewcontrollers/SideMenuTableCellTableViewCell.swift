//
//  SideMenuTableCellTableViewCell.swift
//  cambridgewines
//
//  Created by Poonam on 31/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class SideMenuTableCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCellView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
