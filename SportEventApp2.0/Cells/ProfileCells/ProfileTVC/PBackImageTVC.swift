//
//  ProfileBackImageTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 05.09.2024.
//

import Foundation
import UIKit
import SnapKit


class PBackImageTVC: UITableViewCell {
    
    let identifier = PBackImageTVC.identifier()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PBackImageTVC {
    
    private func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        let pBackImage = UIImageView(image: UIImage(named: "ronaldo"))
        contentView.addSubview(pBackImage)
        
        let shareButton = UIButton(type: .system)
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        shareButton.backgroundColor = .lightGray
        shareButton.layer.cornerRadius = 20
        shareButton.tintColor = .black
        shareButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(shareButton)
        
        let saveButton = UIButton(type: .system)
        saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        saveButton.backgroundColor = .lightGray
        saveButton.layer.cornerRadius = 20
        saveButton.tintColor = .black
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(saveButton)
        
        pBackImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(750)
        }
        shareButton .snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalTo(saveButton).inset(52)
            $0.bottom.equalTo(pBackImage.snp.top)
            $0.height.width.equalTo(40)
        }
        
        saveButton .snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(pBackImage.snp.top)
            $0.height.width.equalTo(40)
        }
        
        let pStackView = UIStackView(arrangedSubviews: ["Age", "Games", "Goals"].map { titleText in
            
            let pView = UIView()
            pView.backgroundColor = .darkGray
            pView.layer.cornerRadius = 10
            pView.alpha = 0.9
            
            let pTitle = UILabel()
            pTitle.text = titleText
            pTitle.textColor = .white
            pView.addSubview(pTitle)
            
            let pCount = UILabel()
            pCount.textColor = .white
            pCount.font = .boldSystemFont(ofSize: 24)
            pCount.textAlignment = .right
            pView.addSubview(pCount)
            
            pTitle.snp.makeConstraints {
                $0.leading.trailing.top.equalToSuperview().inset(16)
            }
            
            pCount.snp.makeConstraints {
                $0.trailing.bottom.leading.equalToSuperview().inset(16)
            }
            
            return pView
        })
        let element = [39, 196, 118]
        
        pStackView.arrangedSubviews.enumerated().forEach { (index, view) in
            (view.subviews.last as? UILabel)?.text = element[index].description
        }
        pStackView.axis = .horizontal
        pStackView.spacing = 12
        pStackView.distribution = .fillEqually
        contentView.addSubview(pStackView)
        
        pStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(128)
        }
    }
    @objc
    func buttonTapped(){
        print("buttonTapped")
    }
}
