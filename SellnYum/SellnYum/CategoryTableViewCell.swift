//
//  CategoryTableViewCell.swift
//  SellnYum
//
//  Created by student5310 on 12/02/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var nbRecetteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func creatCell(cat:Category){
        
        nomLabel.text=cat.name
        nbRecetteLabel.text = String(cat.meals.count)+" recettes"
    }
    
}
