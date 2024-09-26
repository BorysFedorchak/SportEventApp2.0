//
//  ProfileBackImageTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 05.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - PBackImageTVC

class PBackImageTVC: UITableViewCell {
    
    // MARK: - Properties
    
    let identifier = PBackImageTVC.identifier()
    
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

extension PBackImageTVC {
    
    private func setupView() {
        
        // MARK: - Content View Configuration
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        // MARK: - Background Image
        
        let backImage = UIImageView(image: UIImage(named: "ronaldo"))
        contentView.addSubview(backImage)
        
        // MARK: - Share Button
        
        let shareButton = UIButton(type: .system)
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        shareButton.backgroundColor = .lightGray
        shareButton.layer.cornerRadius = 20
        shareButton.tintColor = .black
        shareButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(shareButton)
        
        // MARK: - Save Button
        
        let saveButton = UIButton(type: .system)
        saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        saveButton.backgroundColor = .lightGray
        saveButton.layer.cornerRadius = 20
        saveButton.tintColor = .black
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(saveButton)
        
        backImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(750)
        }
        shareButton .snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalTo(saveButton).inset(52)
            $0.bottom.equalTo(backImage.snp.top)
            $0.height.width.equalTo(40)
        }
        
        saveButton .snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(backImage.snp.top)
            $0.height.width.equalTo(40)
        }
        
        // MARK: - Statistics Stack View
        
        let stackView = UIStackView(arrangedSubviews: ["Age", "Games", "Goals"].map { titleText in
            
            let view = UIView()
            view.backgroundColor = .darkGray
            view.layer.cornerRadius = 10
            view.alpha = 0.9
            
            let title = UILabel()
            title.text = titleText
            title.textColor = .white
            view.addSubview(title)
            
            let count = UILabel()
            count.textColor = .white
            count.font = .boldSystemFont(ofSize: 24)
            count.textAlignment = .right
            view.addSubview(count)
            
            title.snp.makeConstraints {
                $0.leading.trailing.top.equalToSuperview().inset(16)
            }
            
            count.snp.makeConstraints {
                $0.trailing.bottom.leading.equalToSuperview().inset(16)
            }
            
            return view
        })
        let element = [39, 196, 118]
        
        stackView.arrangedSubviews.enumerated().forEach { (index, view) in
            (view.subviews.last as? UILabel)?.text = element[index].description
        }
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(128)
        }
    }
    
    // MARK: - Button Action
    
    @objc
    func buttonTapped() {
        print("buttonTapped")
    }
}
