//
//  NewsTableViewCell.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 27/07/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //  Outlets
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var value: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
