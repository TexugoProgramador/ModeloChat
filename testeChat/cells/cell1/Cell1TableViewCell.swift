//
//  Cell1TableViewCell.swift
//  testeChat
//
//  Created by humberto Lima on 20/09/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

class Cell1TableViewCell: UITableViewCell {

    @IBOutlet var labelMensagem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelMensagem.clipsToBounds = true
        labelMensagem.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
