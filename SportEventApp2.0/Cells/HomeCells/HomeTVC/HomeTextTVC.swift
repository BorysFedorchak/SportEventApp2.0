//
//  HomeTextTVC.swift
//  SportEventApp2.0
//
//  Created by borys on 21.08.2024.
//

import Foundation
import UIKit
import SnapKit
import CoreData

// MARK: - HomeTextTVC

class HomeTextTVC: UITableViewCell{
    
    // MARK: - Outlets
    
    @IBOutlet weak var TextLeft: UILabel!
    // MARK: - Properties
    
    let identifier = HomeTextTVC.identifier()
    let nib = HomeTextTVC.nib()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

extension HomeTextTVC {
    
    private func setupView() {

        let button = UIButton(type: .system)
        button.setTitle("Add Event", for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        contentView.addSubview(button)
        
        button.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc func nextTap() {
        if let addEventVC = self.addEventVC {
            let newVC = AddEventVC()
            addEventVC.present(newVC, animated: true, completion: nil)
        }
    }
}

extension UIView {
    var addEventVC: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
