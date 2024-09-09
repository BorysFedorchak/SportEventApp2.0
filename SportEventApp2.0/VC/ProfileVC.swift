//
//  ProfileVC.swift
//  SportEventApp2.0
//
//  Created by borys on 05.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - ProfileVC

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - TableView Setup
        
        let profileTV = UITableView()
        
        profileTV.showsVerticalScrollIndicator = false
        profileTV.separatorStyle = .none
        profileTV.backgroundColor = .clear
        profileTV.delegate = self
        profileTV.dataSource = self
        view.addSubview(profileTV)
        
        profileTV.register(PBackImageTVC.self, forCellReuseIdentifier: PBackImageTVC.identifier())
        profileTV.register(PStatsTVC.self, forCellReuseIdentifier: PStatsTVC.identifier())
        profileTV.register(PTrophiesTVC.self, forCellReuseIdentifier: PTrophiesTVC.identifier())
        profileTV.register(PHistoryTVC.self, forCellReuseIdentifier: PHistoryTVC.identifier())
        
        profileTV.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 772
        case 1 :
            return 360
        case 2 :
            return 280
        case 3 :
            return 220
        default :
            return 0
        }
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
        let pImageCell = tableView.dequeueReusableCell(withIdentifier: PBackImageTVC.identifier()) as! PBackImageTVC
        let pStatsCell = tableView.dequeueReusableCell(withIdentifier: PStatsTVC.identifier()) as! PStatsTVC
        let PTropfiesCell = tableView.dequeueReusableCell(withIdentifier: PTrophiesTVC.identifier()) as! PTrophiesTVC
        let pHistoryCell = tableView.dequeueReusableCell(withIdentifier: PHistoryTVC.identifier()) as! PHistoryTVC

        switch indexPath.section {
        case 0:
            return pImageCell
        case 1:
            return pStatsCell
        case 2:
            return PTropfiesCell
        case 3:
            return pHistoryCell
        default:
            return pImageCell
        }
    }
}
