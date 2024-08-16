//
//  SingUpVC.swift
//  SportEventApp2.0
//
//  Created by borys on 14.08.2024.
//

import Foundation
import UIKit

class SingUpVC: UIViewController {
    
    @IBOutlet weak var SUpImageView: UIImageView!
    
    @IBOutlet weak var SUpView: UIView!
    @IBOutlet weak var SUpLabel: UILabel!
    @IBOutlet weak var SUpStackView: UIStackView!
    
    @IBOutlet weak var SUpButton: UIButton!
    
    @IBOutlet weak var SUpNameTF: UITextField!
    @IBOutlet weak var SUpEmailTF: UITextField!
    @IBOutlet weak var SUpPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nameImage = UIImage(systemName: "person")
        addLeftImage(textField: SUpNameTF, image: nameImage!)
        
        let emailImage = UIImage(systemName: "envelope")
        addLeftImage(textField: SUpEmailTF, image: emailImage!)
        
        let passwordImage = UIImage(systemName: "lock")
        addLeftImage(textField: SUpPasswordTF, image: passwordImage!)
        
        SUpNameTF.configureTF()
        SUpEmailTF.configureTF()
        SUpPasswordTF.configureTF()
        
    }
    
    func addLeftImage(textField: UITextField, image: UIImage) {
        let padding = 16
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + CGFloat(padding), height: image.size.height) )
        let leftImageView = UIImageView(frame: CGRect(x: CGFloat(padding), y: 0.0, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        leftImageView.tintColor = UIColor(red: 0.27, green: 0.35, blue: 0.49, alpha: 1.00)
        outerView.addSubview(leftImageView)
        textField.leftView = outerView
        textField.leftViewMode = .always
    }
    
}

extension UITextField {
    func configureTF() {
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.27, green: 0.35, blue: 0.49, alpha: 1.00).cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
