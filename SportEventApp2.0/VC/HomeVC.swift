//
//  HomeVC.swift
//  SportEventApp2.0
//
//  Created by borys on 16.08.2024.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var HomeLabel: UILabel!
    @IBOutlet weak var HomeStackView: UIStackView!
    
    @IBOutlet weak var HomeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeTableView.showsVerticalScrollIndicator = false
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.register(HomeImageTVC.nib(), forCellReuseIdentifier: HomeImageTVC.identifier())
        HomeTableView.register(HomeCollectionTVC.nib(), forCellReuseIdentifier: HomeCollectionTVC.identifier())
        HomeTableView.register(HomeTextTVC.nib(), forCellReuseIdentifier: HomeTextTVC.identifier())
        HomeTableView.register(HomeEventsTVC.nib(), forCellReuseIdentifier: HomeEventsTVC.identifier())
        HomeTableView.backgroundColor = .clear
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 232
        case 1:
            return 138
        case 2:
            return 60
        case 3:
            return 360
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: HomeImageTVC.identifier()) as! HomeImageTVC
        let collectionCell = tableView.dequeueReusableCell(withIdentifier: HomeCollectionTVC.identifier()) as! HomeCollectionTVC
        let textCell = tableView.dequeueReusableCell(withIdentifier: HomeTextTVC.identifier()) as! HomeTextTVC
        let eventsCell = tableView.dequeueReusableCell(withIdentifier: HomeEventsTVC.identifier()) as! HomeEventsTVC

        switch indexPath.section {
        case 0:
            return imageCell
        case 1:
            return collectionCell
        case 2:
            return textCell
        case 3:
            return eventsCell
        default:
            return imageCell
        }
    }
}
