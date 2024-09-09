//
//  ProfileCVC.swift
//  SportEventApp2.0
//
//  Created by borys on 07.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - PTrophiesCVC

class PTrophiesCVC: UICollectionViewCell {
    
    // MARK: - Properties
    
    let identifier = PTrophiesCVC.identifier()
    
    let tTitle = UILabel()
    let tCount = UILabel()
    let tImage = UIImageView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup Methods

extension PTrophiesCVC {
    private func setupView() {
        
        // MARK: - Container View
        
        let tView = UIView()
        tView.backgroundColor = .darkGray
        tView.layer.cornerRadius = 10
        tView.alpha = 0.9
        contentView.addSubview(tView)
        
        // MARK: - Title Label
        
        tTitle.text = trophies.description
        tTitle.textColor = .white
        tTitle.numberOfLines = 0
        tView.addSubview(tTitle)
        
        // MARK: - Count View
        
        let countView = UIView()
        countView.backgroundColor = .systemGreen
        countView.layer.cornerRadius = 14
        countView.clipsToBounds = true
        tView.addSubview(countView)
        
        // MARK: - Count Label
        
        tCount.text = trophiesCount.description
        tCount.textColor = .white
        tCount.font = .boldSystemFont(ofSize: 24)
        tCount.textAlignment = .center
        countView.addSubview(tCount)
        
        // MARK: - Image View
        
        tView.addSubview(tImage)
        
        tView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tTitle.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(16)
            $0.width.equalTo(40)
        }
        
        countView.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(28)
        }
        
        tCount.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tImage.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(4)
            $0.width.equalTo(80)
            $0.height.equalTo(100)
        }
    }
}
