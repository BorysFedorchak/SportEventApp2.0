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
        
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.register(HomeImageTVC.nib(), forCellReuseIdentifier: HomeImageTVC.identifier())
        HomeTableView.register(HomeCollectionTVC.nib(), forCellReuseIdentifier: HomeCollectionTVC.identifier())
        HomeTableView.backgroundColor = .clear
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 231
        case 1:
            return 138
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
//        case 2:
//            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: HomeImageTVC.identifier()) as! HomeImageTVC
        let collectionCell = tableView.dequeueReusableCell(withIdentifier: HomeCollectionTVC.identifier()) as! HomeCollectionTVC
        
        switch indexPath.section {
        case 0:
            return imageCell
        case 1:
            return collectionCell
        default:
            return imageCell
        }
    }
}




