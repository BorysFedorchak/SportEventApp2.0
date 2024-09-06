//
//  HomeCollectionTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 18.08.2024.
//

import Foundation
import UIKit

var sports: [String] = ["Soccer", "Basketball", "Football", "Baseball", "Tennis", "Volleyball", "Golf"]
var sportsImage: [UIImage] = [.soccerBall, .basketball, .americanFootball, .baseball, .tennis, .volleyball, .golf]

class HomeCollectionTVC: UITableViewCell {
  
    @IBOutlet weak var HTVCCollectionView: UICollectionView!
    
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
