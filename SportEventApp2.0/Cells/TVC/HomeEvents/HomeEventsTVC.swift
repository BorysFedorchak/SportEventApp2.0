//
//  HomeEventsTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 21.08.2024.
//

import Foundation
import UIKit

var eventsTeamName: [String] = ["Barcelona", "RealMadrid", "PSG", "Liverpool"]
var eventsTeamImage: [UIImage] = [.barcelona, .realMadrid, .PSG, .liverpool]
var eventsResult: [String] = ["3   -   4", "2   -   0"]

class HomeEventsTVC: UITableViewCell {
    
    @IBOutlet weak var EventsCollectionView: UICollectionView!
    
    let identifier = HomeEventsTVC.identifier()
    let nib = HomeEventsTVC.nib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        EventsCollectionView.showsVerticalScrollIndicator = false
        EventsCollectionView.dataSource = self
        EventsCollectionView.delegate = self
        EventsCollectionView.register(HomeEventsCVC.nib(), forCellWithReuseIdentifier: HomeEventsCVC.identifier())
    }
}

extension HomeEventsTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventsCVC.identifier(), for: indexPath) as! HomeEventsCVC
        if indexPath.section == 0 {
            cell.EventsFirstLabel.text = eventsTeamName[0]
            cell.EventsFirstImage.image = eventsTeamImage[0]
            cell.EventsSecondLabel.text = eventsTeamName[1]
            cell.EventsSecondImage.image = eventsTeamImage[1]
            cell.EventsCenterLabel.text = eventsResult[0]
        } else if indexPath.section == 1 {
            cell.EventsFirstLabel.text = eventsTeamName[2]
            cell.EventsFirstImage.image = eventsTeamImage[2]
            cell.EventsSecondLabel.text = eventsTeamName[3]
            cell.EventsSecondImage.image = eventsTeamImage[3]
            cell.EventsCenterLabel.text = eventsResult[1]
        }
        return cell
    }
}
