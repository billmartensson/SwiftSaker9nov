//
//  PersonTableViewCell.swift
//  Saker9nov
//
//  Created by Bill Martensson on 2020-11-09.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var thevc : ViewController?
    var myIndexpath : IndexPath?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func doMinus(_ sender: Any) {
        print("MINUS")
        thevc?.letsMinus(rownumber: myIndexpath!)
    }
    
    @IBAction func doPlus(_ sender: Any) {
        print("PLUS")
        thevc?.letsPlus(rownumber: myIndexpath!)
    }
}
