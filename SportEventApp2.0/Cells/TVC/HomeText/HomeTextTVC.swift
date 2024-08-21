//
//  HomeTextTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 21.08.2024.
//

import Foundation
import UIKit

class HomeTextTVC: UITableViewCell{
    
    @IBOutlet weak var TextLeft: UILabel!
    @IBOutlet weak var TextRight: UILabel!
    
    let identifier = HomeTextTVC.identifier()
    let nib = HomeTextTVC.nib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
