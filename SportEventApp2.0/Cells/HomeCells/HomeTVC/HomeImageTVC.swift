//
//  HomeFirstTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 18.08.2024.
//

import Foundation
import UIKit

@IBDesignable

// MARK: - HomeImageTVC

class HomeImageTVC: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var HFTVCImage: UIImageView!
    
    // MARK: - Properties
    
    let identifier = HomeImageTVC.identifier()
    let nib = HomeImageTVC.nib()
}
