//
//  ProfileVC.swift
//  SportEventApp2.0
//
//  Created by borys on 05.09.2024.
//

import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileTV = UITableView()
        
        profileTV.showsVerticalScrollIndicator = false
        profileTV.backgroundColor = .clear
        profileTV.delegate = self
        profileTV.dataSource = self
        view.addSubview(profileTV)
        
        profileTV.register(PBackImageTVC.self, forCellReuseIdentifier: PBackImageTVC.identifier())
        profileTV.register(PStatsTVC.self, forCellReuseIdentifier: PStatsTVC.identifier())
        
        profileTV.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 772
        case 1 :
            return 160
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
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pImageCell = tableView.dequeueReusableCell(withIdentifier: PBackImageTVC.identifier()) as! PBackImageTVC
        let pIStatsCell = tableView.dequeueReusableCell(withIdentifier: PStatsTVC.identifier()) as! PStatsTVC

        switch indexPath.section {
        case 0:
            return pImageCell
        case 1:
            return pIStatsCell
        default:
            return pImageCell
        }
    }
}
