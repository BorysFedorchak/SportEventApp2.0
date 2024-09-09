//
//  PStatsTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 08.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - PStatsTVC

class PStatsTVC: UITableViewCell {
    
    // MARK: - Properties
    
    let identifier = PStatsTVC.identifier()
    
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

extension PStatsTVC {
    
    private func setupView() {
        
        // MARK: - Content View Configuration
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        // MARK: - Header Label
        
        let headerLabel = UILabel()
        headerLabel.text = "STATISTICS"
        headerLabel.textColor = .black
        headerLabel.font = .boldSystemFont(ofSize: 20)
        contentView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        // MARK: - Goal View
        
        let goalView = UIView()
        goalView.backgroundColor = .systemGreen
        goalView.layer.cornerRadius = 10
        goalView.alpha = 0.9
        contentView.addSubview(goalView)
        
        let goalTitle = UILabel()
        goalTitle.text = "GOALS"
        goalTitle.textColor = .white
        goalTitle.font = .boldSystemFont(ofSize: 24)
        goalView.addSubview(goalTitle)
        
        let shoeImage = UIImageView(image: UIImage(named: "soccerShoe"))
        goalView.addSubview(shoeImage)
        
        let countGoalTitle = UILabel()
        countGoalTitle.text = "118"
        countGoalTitle.textColor = .white
        countGoalTitle.font = .boldSystemFont(ofSize: 24)
        countGoalTitle.textAlignment = .right
        goalView.addSubview(countGoalTitle)
        
        goalView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(128)
        }
        
        goalTitle.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(4)
        }
        
        shoeImage.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        countGoalTitle.snp.makeConstraints {
            $0.trailing.bottom.leading.equalToSuperview().inset(8)
        }
        
        // MARK: - First Circle View
        
        let firstСircleView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        firstСircleView.progress = 0.75
        contentView.addSubview(firstСircleView)

        firstСircleView.snp.makeConstraints {
            $0.centerY.equalTo(goalView.snp.centerY).offset(-20)
            $0.leading.equalTo(goalView.snp.trailing).offset(40)
            $0.width.height.equalTo(80)
        }
        
        let numberView = UIView()
        numberView.backgroundColor = .systemGreen
        numberView.layer.cornerRadius = 14
        numberView.clipsToBounds = true
        firstСircleView.addSubview(numberView)
        
        let firstCircleNumber = UILabel()
        firstCircleNumber.text = "8"
        firstCircleNumber.textColor = .white
        firstCircleNumber.font = .systemFont(ofSize: 16)
        firstCircleNumber.numberOfLines = 2
        firstCircleNumber.textAlignment = .center
        numberView.addSubview(firstCircleNumber)
        
        numberView.snp.makeConstraints {
            $0.centerY.equalTo(firstСircleView.snp.centerY)
            $0.centerX.equalTo(firstСircleView.snp.centerX)
            $0.width.height.equalTo(28)
        }
        
        firstCircleNumber.snp.makeConstraints {
            $0.centerY.equalTo(numberView.snp.centerY)
            $0.centerX.equalTo(numberView.snp.centerX)
            $0.width.height.equalTo(16)
        }
        
        // MARK: - Second Circle Progress View
        
        let secondCircleView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        secondCircleView.progress = 0.5
        contentView.addSubview(secondCircleView)
        
        secondCircleView.snp.makeConstraints {
            $0.centerY.equalTo(firstСircleView.snp.centerY)
            $0.leading.equalTo(firstСircleView.snp.trailing).offset(40)
            $0.width.height.equalTo(80)
        }
        
        let secondNumberView = UIView()
        secondNumberView.backgroundColor = .systemGreen
        secondNumberView.layer.cornerRadius = 14
        secondNumberView.clipsToBounds = true
        secondCircleView.addSubview(secondNumberView)
        
        let secondCircleNumber = UILabel()
        secondCircleNumber.text = "6"
        secondCircleNumber.textColor = .white
        secondCircleNumber.font = .systemFont(ofSize: 16)
        secondCircleNumber.numberOfLines = 2
        secondCircleNumber.textAlignment = .center
        secondNumberView.addSubview(secondCircleNumber)
        
        secondNumberView.snp.makeConstraints {
            $0.centerY.equalTo(secondCircleView.snp.centerY)
            $0.centerX.equalTo(secondCircleView.snp.centerX)
            $0.width.height.equalTo(28)
        }
        
        secondCircleNumber.snp.makeConstraints {
            $0.centerY.equalTo(secondNumberView.snp.centerY)
            $0.centerX.equalTo(secondNumberView.snp.centerX)
            $0.width.height.equalTo(16)
        }
        
        // MARK: - Circle Titles
        
        let firstCircleTitle = UILabel()
        firstCircleTitle.text = "Shots on target"
        firstCircleTitle.textColor = .black
        firstCircleTitle.font = .systemFont(ofSize: 12)
        firstCircleTitle.numberOfLines = 2
        firstCircleTitle.textAlignment = .center
        contentView.addSubview(firstCircleTitle)
        
        let secondCircleTitle = UILabel()
        secondCircleTitle.text = "Goals scored"
        secondCircleTitle.textColor = .black
        secondCircleTitle.font = .systemFont(ofSize: 12)
        secondCircleTitle.numberOfLines = 2
        secondCircleTitle.textAlignment = .center
        contentView.addSubview(secondCircleTitle)
        
        firstCircleTitle.snp.makeConstraints {
            $0.top.equalTo(firstСircleView.snp.bottom).offset(16)
            $0.centerX.equalTo(firstСircleView.snp.centerX)
            $0.width.equalTo(56)
        }
        
        secondCircleTitle.snp.makeConstraints {
            $0.top.equalTo(secondCircleView.snp.bottom).offset(16)
            $0.centerX.equalTo(secondCircleView.snp.centerX)
            $0.width.equalTo(56)
        }
        
        // MARK: - Discipline Section
        
        let disciplineTitle = UILabel()
        disciplineTitle.text = "DISCIPLINE"
        disciplineTitle.textColor = .darkGray
        disciplineTitle.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(disciplineTitle)
        
        
        let disciplineView = UIView()
        disciplineView.backgroundColor = .systemGreen
        contentView.addSubview(disciplineView)
        
        disciplineTitle.snp.makeConstraints {
            $0.top.equalTo(goalView.snp.bottom).offset(24)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        
        disciplineView.snp.makeConstraints {
            $0.centerY.equalTo(disciplineTitle.snp.centerY)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(disciplineTitle.snp.leading).inset(-12)
            $0.height.equalTo(28)
        }
        
        // MARK: - Discipline Stack
        
        let disciplineStack = UIStackView(arrangedSubviews: (0..<4).map { index in
            
            let dView = UIView()
            dView.backgroundColor = .darkGray
            dView.layer.cornerRadius = 10
            
            let dCount = UILabel()
            dCount.textColor = .white
            dCount.font = .boldSystemFont(ofSize: 32)
            dView.addSubview(dCount)
            
            let dTitle = UILabel()
            dTitle.textColor = .systemGray4
            dTitle.font = .systemFont(ofSize: 12)
            dTitle.numberOfLines = 2
            dView.addSubview(dTitle)
            
            dCount.snp.makeConstraints {
                $0.width.equalTo(24)
                $0.leading.top.equalToSuperview().inset(16)
            }
            
            dTitle.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.bottom.equalToSuperview().inset(8)
                $0.width.equalTo(56)
            }
            
            let cardImageView = UIImageView()
            if index == 2 {
                cardImageView.image = UIImage(named: "yellowCard")
            } else if index == 3 {
                cardImageView.image = UIImage(named: "redCard")
            }
            
            dView.addSubview(cardImageView)
            
            cardImageView.snp.makeConstraints {
                $0.leading.equalTo(dCount.snp.trailing)
                $0.centerY.equalTo(dCount.snp.centerY)
                $0.width.height.equalTo(32)
            }
            
            let element = ["Fouls won", "Fouls conceded", "Yellow cards", "Red cards"]
            dCount.text = ["8", "3", "3", "1"][index]
            dTitle.text = element[index]
            
            return dView
        })
        
        let element = ["Fouls won", "Fouls conceded", "Yellow cards", "Red cards"]
        
        disciplineStack.arrangedSubviews.enumerated().forEach { (index, view) in
            (view.subviews.last as? UILabel)?.text = element[index].description
        }
        
        disciplineStack.axis = .horizontal
        disciplineStack.spacing = 4
        disciplineStack.distribution = .fillEqually
        contentView.addSubview(disciplineStack)
        
        disciplineStack.snp.makeConstraints {
            $0.top.equalTo(disciplineTitle.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(112)
        }
    }
}
