//
//  PCollectionTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 06.09.2024.
//

import Foundation
import UIKit
import SnapKit

class PStatsTVC: UITableViewCell {
    
    let identifier = PStatsTVC.identifier()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PStatsTVC {
    
    private func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
    }
}
