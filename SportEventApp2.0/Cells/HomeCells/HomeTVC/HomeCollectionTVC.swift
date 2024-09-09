//
//  HomeCollectionTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 18.08.2024.
//

import Foundation
import UIKit

//MARK: - Data 

var sports: [String] = ["Soccer", "Basketball", "Football", "Baseball", "Tennis", "Volleyball", "Golf"]
var sportsImage: [UIImage] = [.soccerBall, .basketball, .americanFootball, .baseball, .tennis, .volleyball, .golf]

// MARK: - HomeCollectionTVC

class HomeCollectionTVC: UITableViewCell {
  
    // MARK: - Outlets
    
    @IBOutlet weak var HTVCCollectionView: UICollectionView!
    
    // MARK: - Initialization
    
    let identifier = HomeCollectionTVC.identifier()
    let nib = HomeCollectionTVC.nib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        HTVCCollectionView.showsHorizontalScrollIndicator = false
        HTVCCollectionView.dataSource = self
        HTVCCollectionView.delegate = self
        HTVCCollectionView.register(HomeCVC.nib(), forCellWithReuseIdentifier: HomeCVC.identifier())
    }
}

// MARK: - UICollectionViewDelegate & DataSource

extension HomeCollectionTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVC.identifier(), for: indexPath) as! HomeCVC
        cell.HomeCVCLabel.text = sports[indexPath.row]
        cell.HomeCVCImage.image = sportsImage[indexPath.row]
        return cell
    }
}
