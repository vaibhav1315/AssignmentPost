//
//  PostTableViewCell.swift
//  FirrstAPIAssignemts
//
//  Created by Mac on 08/08/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

   
    @IBOutlet weak var postidlabel: UILabel!
    
    
    @IBOutlet weak var idlabel: UILabel!
    
    
    @IBOutlet weak var postnameLabel: UILabel!
    
    
    @IBOutlet weak var postemaillabel: UILabel!
    
    
    @IBOutlet weak var postbodyLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
