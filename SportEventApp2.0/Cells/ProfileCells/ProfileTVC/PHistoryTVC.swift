//
//  PHistoryTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 08.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - PHistoryTVC

class PHistoryTVC: UITableViewCell {
    
    // MARK: - Properties
    
    let identifier = PHistoryTVC.identifier()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Methods

extension PHistoryTVC {
    
    private func setupView() {
        
        // MARK: - Content View Configuration
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        // MARK: - Header Label
        
        let headerLabel = UILabel()
        headerLabel.text = "HISTORY"
        headerLabel.textColor = .black
        headerLabel.font = .boldSystemFont(ofSize: 20)
        contentView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        // MARK: - Years Stack View
        
        let yearsStackView = UIStackView(arrangedSubviews: ["2016", "2017", "2018", "2019"].map { titleText in
            
            let view = UIView()
            view.backgroundColor = .darkGray
            view.layer.cornerRadius = 10
            view.alpha = 0.9
            
            let title = UILabel()
            title.text = titleText
            title.textColor = .white
            title.textAlignment = .center
            view.addSubview(title)
            
            title.snp.makeConstraints {
                $0.leading.trailing.top.equalToSuperview()
            }
            
            return view
        })
        
        yearsStackView.axis = .horizontal
        yearsStackView.spacing = 40
        yearsStackView.distribution = .fillEqually
        contentView.addSubview(yearsStackView)
        
        yearsStackView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        // MARK: - Line Views
        
        let realMLineView = UIView()
        realMLineView.backgroundColor = .yellow
        contentView.addSubview(realMLineView)
        
        let juventusLineView = UIView()
        juventusLineView.backgroundColor = .black
        contentView.addSubview(juventusLineView)
        
        juventusLineView.snp.makeConstraints {
            $0.top.equalTo(yearsStackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(268)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(realMLineView.snp.top).offset(-32)
            $0.height.equalTo(8)
        }
        
        realMLineView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(164)
            $0.height.equalTo(8)
        }
        
        // MARK: - Images
        
        let realMImage = UIImageView(image: UIImage(named: "RealMadrid"))
        contentView.addSubview(realMImage)
        
        realMImage.snp.makeConstraints {
            $0.leading.equalTo(realMLineView.snp.leading).inset(16)
            $0.centerY.equalTo(realMLineView.snp.centerY)
            $0.width.height.equalTo(40)
        }
        
        let juventusImage = UIImageView(image: UIImage(named: "juventus"))
        contentView.addSubview(juventusImage)
        
        juventusImage.snp.makeConstraints {
            $0.trailing.equalTo(juventusLineView.snp.trailing).inset(140)
            $0.centerY.equalTo(juventusLineView.snp.centerY)
            $0.width.height.equalTo(40)
        }
    }
}
