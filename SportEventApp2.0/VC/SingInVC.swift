//
//  Sing In.swift
//  SportEventApp2.0
//
//  Created by borys on 04.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - SingInVC

class SingInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Back Image
        
        let backImage = UIImageView(image: UIImage(named: "backImage"))
        view.addSubview(backImage)
        
        // MARK: - Form View
        
        let formView = UIView()
        formView.backgroundColor = UIColor(red: 0.04, green: 0.14, blue: 0.25, alpha: 1.00)
        formView.layer.cornerRadius = 16
        view.addSubview(formView)
        
        // MARK: - Title Label
        
        let titleLabel = UILabel()
        titleLabel.text = "Welcome"
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.textColor = .white
        formView.addSubview(titleLabel)
        
        // MARK: - Text Fields
        
        let array: [(UIImage, String, UITextContentType)] = [
            (UIImage(systemName: "envelope")!, "Email or username", .emailAddress),
            (UIImage(systemName: "lock")!, "Password", .password)
        ]
        
        let stackView = UIStackView(arrangedSubviews: array.map({ item in
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(
                string: item.1,
                attributes: [NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.27, 
                                        green: 0.35,
                                        blue: 0.49,
                                        alpha: 1.00)])
            
            textField.textContentType = item.2
            textField.textColor = .white
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = UIColor(red: 0.27,
                                                  green: 0.35,
                                                  blue: 0.49,
                                                  alpha: 1.00).cgColor
            textField.layer.borderWidth = 1
            textField.clipsToBounds = true
            
            let leftImage = UIImageView(image: item.0)
            leftImage.tintColor = UIColor(red: 0.27, green: 0.35, blue: 0.49, alpha: 1.00)
            textField.addSubview(leftImage)
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
            textField.leftViewMode = .always
            
            if item.2 == .password {
                let rightButton = UIButton(type: .custom)
                rightButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                rightButton.tintColor = UIColor(red: 0.27, green: 0.35, blue: 0.49, alpha: 1.00)
                
                textField.rightView = rightButton
                textField.rightViewMode = .always
                textField.isSecureTextEntry = true
                
                textField.addSubview(rightButton)
                rightButton.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
            
                rightButton.snp.makeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.trailing.equalToSuperview().inset(12)
                    $0.height.equalTo(20)
                    $0.width.equalTo(24)
                }
            }
            
            if item.2 == .emailAddress {
                textField.keyboardType = .emailAddress
            } else if item.2 == .password {
                textField.isSecureTextEntry = true
            }
            
            leftImage.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(12)
                $0.height.equalTo(20)
                $0.width.equalTo(24)
            }
            
            textField.snp.makeConstraints {
                $0.height.equalTo(60)
            }
            
            return textField
        }))
        stackView.axis = .vertical
        stackView.spacing = 16
        formView.addSubview(stackView)
        
        // MARK: - Forgot Password Button
        
        let forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(UIColor(red: 0.44, green: 0.58, blue: 0.85, alpha: 1.00), for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        formView.addSubview(forgotPasswordButton)
        
        // MARK: - Sign In Button
        
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.31, green: 0.41, blue: 0.86, alpha: 1.00)
        button.layer.cornerRadius = 16
        button.layer.cornerCurve = .continuous
        button.addTarget(self, action: #selector(nextHomeVC), for: .touchUpInside)
        formView.addSubview(button)
        
        // MARK: - Sign Up Button
        
        let DSingUpButton = UIButton(type: .system)
        DSingUpButton.setTitle("Don't have an Account? Sing Up", for: .normal)
        DSingUpButton.setTitleColor(UIColor(red: 0.44, green: 0.58, blue: 0.85, alpha: 1.00), for: .normal)
        DSingUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        DSingUpButton.addTarget(self, action: #selector(nextSingUpVC), for: .touchUpInside)
        formView.addSubview(DSingUpButton)

        
        backImage.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(268)
        }
        
        formView.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-44)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).inset(-24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(60)
        }
        
        DSingUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Toggle Password Visibility
    
    @objc
    func togglePasswordVisibility(_ sender: UIButton) {
        if let textField = sender.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            let buttonImage = textField.isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
            sender.setImage(buttonImage, for: .normal)
        }
    }
    
    // MARK: - Navigation
    
    @objc
    func nextHomeVC() {
        if let existingVC = navigationController?.viewControllers.first(where: { $0 is HomeVC }) {
            navigationController?.popToViewController(existingVC, animated: true)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeID") as! HomeVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @objc
    func nextSingUpVC() {
        if let existingVC = navigationController?.viewControllers.first(where: { $0 is SingUpVC }) {
            navigationController?.popToViewController(existingVC, animated: true)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "singUpID") as! SingUpVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
