//
//  HomeTextTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 21.08.2024.
//

import Foundation
import UIKit

// MARK: - HomeTextTVC

class HomeTextTVC: UITableViewCell{
    
    // MARK: - Outlets
    
    @IBOutlet weak var TextLeft: UILabel!
    @IBOutlet weak var TextRight: UILabel!
    
    // MARK: - Properties
    
    let identifier = HomeTextTVC.identifier()
    let nib = HomeTextTVC.nib()
}
