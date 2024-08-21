//
//  HomeCVC.swift
//  SportEventApp2.0
//
//  Created by borys on 18.08.2024.
//

import Foundation
import UIKit

class HomeCVC: UICollectionViewCell {
    
    @IBOutlet weak var HomeCVCImage: UIImageView!
    @IBOutlet weak var HomeCVCLabel: UILabel!
    
    let identifier = HomeCVC.identifier()
    let nib = HomeCVC.nib()
}
