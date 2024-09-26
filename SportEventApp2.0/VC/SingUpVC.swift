//
//  SingUpVC.swift
//  SportEventApp2.0
//
//  Created by borys on 14.08.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - SingUpVC

class SingUpVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var SUpImageView: UIImageView!
    
    @IBOutlet weak var SUpView: UIView!
    @IBOutlet weak var SUpLabel: UILabel!
    @IBOutlet weak var SUpStackView: UIStackView!
    
    @IBOutlet weak var SUpButton: UIButton!
    
    @IBOutlet weak var SUpNameTF: UITextField!
    @IBOutlet weak var SUpEmailTF: UITextField!
    @IBOutlet weak var SUpPasswordTF: UITextField!

    @IBOutlet weak var LogInButton: UIButton!
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        setupCD()
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LogInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        LogInButton.addTarget(self, action: #selector(nextSingInVC), for: .touchUpInside)
        
        let nameImage = UIImage(systemName: "person")
        addLeftImage(textField: SUpNameTF, image: nameImage!)
        
        let emailImage = UIImage(systemName: "envelope")
        addLeftImage(textField: SUpEmailTF, image: emailImage!)
        
        let passwordImage = UIImage(systemName: "lock")
        addLeftImage(textField: SUpPasswordTF, image: passwordImage!)
        
        SUpNameTF.configureTF()
        SUpEmailTF.configureTF()
        SUpPasswordTF.configureTF()
        SUpPasswordTF.textContentType = .oneTimeCode
        SUpPasswordTF.isSecureTextEntry = true
    }
    
    private func setupCD() {
        let service = CoreDataService()
        
        guard let name = SUpNameTF.text, !name.isEmpty,
              let email = SUpEmailTF.text, !email.isEmpty,
              let password = SUpPasswordTF.text, !password.isEmpty else {
            return
        }
        
        service.saveNewUser(name: name, email: email, password: password)
        print("-------------😀---------------")
        service.getUsers().forEach { print($0) }
        print("-------------😀---------------")
    }
    
    // MARK: - Methods
    
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
    
    @objc
    func nextSingInVC() {
        
        if let existingVC = navigationController?.viewControllers.first(where: { $0 is SingInVC }) {
            navigationController?.popToViewController(existingVC, animated: true)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "singInID") as! SingInVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
}

// MARK: - UITextField Extension

extension UITextField {
    func configureTF() {
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.27, green: 0.35, blue: 0.49, alpha: 1.00).cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
