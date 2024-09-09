//
//  HomeEventsCVC.swift
//  SportEventApp2.0
//
//  Created by borys on 21.08.2024.
//

import Foundation
import UIKit

// MARK: - HomeEventsCVC

class HomeEventsCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var EventsFirstImage: UIImageView!
    @IBOutlet weak var EventsFirstLabel: UILabel!
    
    @IBOutlet weak var EventsSecondImage: UIImageView!
    @IBOutlet weak var EventsSecondLabel: UILabel!
    
    @IBOutlet weak var EventsCenterLabel: UILabel!
    
    // MARK: - Properties
    
    let identifier = HomeEventsCVC.identifier()
    let nib = HomeEventsCVC.nib()
}
