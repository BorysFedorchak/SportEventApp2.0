//
//  PCollectionTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 06.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - Data

public var trophies: [String] = ["European cup", "Fifa Club World cup", "European super cup", "World Golden Ball cup"]
public var trophiesImage: [UIImage] = [.europeanCup, .fifaClubWorldCup, .europeanSuperCup, .worldGoldenBallCup]
public var trophiesCount: [String] = ["5", "4", "1", "5"]

// MARK: - PTrophiesTVC

class PTrophiesTVC: UITableViewCell {
    
    // MARK: - Properties
    
    let identifier = PTrophiesTVC.identifier()
    
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

extension PTrophiesTVC {
    
    private func setupView() {
        
        // MARK: - Content View Configuration
        
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        // MARK: - Header Label
        
        let headerLabel = UILabel()
        headerLabel.text = "TROPHIES"
        headerLabel.textColor = .black
        headerLabel.font = .boldSystemFont(ofSize: 20)
        contentView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        //MARK: - Collection View
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 128, height: 160)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PTrophiesCVC.self, forCellWithReuseIdentifier: PTrophiesCVC.identifier())
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(200)
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension PTrophiesTVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trophies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PTrophiesCVC.identifier(), for: indexPath) as! PTrophiesCVC
        cell.tTitle.text = trophies[indexPath.row]
        cell.tCount.text = trophiesCount[indexPath.row]
        cell.tImage.image = trophiesImage[indexPath.row]
        return cell
    }
}
