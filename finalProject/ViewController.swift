//
//  ViewController.swift
//  finalProject
//
//  Created by Fuad Hasan on 29/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//


import UIKit
import Firebase
    
    class ViewController: UIViewController {
        
        let EmailTextFiled:UITextField = {
            let textFiled = UITextField()
            textFiled.placeholder = "Email"
            textFiled.borderStyle = .roundedRect
            textFiled.layer.cornerRadius = 8
            textFiled.backgroundColor = UIColor(white: 0.95, alpha: 0.5)
            // textFiled.addTarget(self, action: #selector(handleError), for: .editingChanged)
            return textFiled
        }()
        
        let NameTextField:UITextField = {
            let textFiled = UITextField()
            textFiled.placeholder = "Name"
            textFiled.borderStyle = .roundedRect
            textFiled.backgroundColor = UIColor(white: 0.95, alpha: 0.5)
            //textFiled.addTarget(self, action: #selector(handleError), for: .editingChanged)
            return textFiled
        }()
        
        let JobTitle:UITextField = {
            let textFiled = UITextField()
            textFiled.placeholder = "Job Title"
            textFiled.borderStyle = .roundedRect
            textFiled.backgroundColor = UIColor(white: 0.95, alpha: 0.5)
            //textFiled.addTarget(self, action: #selector(handleError), for: .editingChanged)
            return textFiled
        }()
        let nextButton:UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Login", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
           // button.addTarget(self, action: #selector(handleTarget), for: .touchUpInside)
            button.clipsToBounds = true
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            return button
        }()
        
        
        
        @objc func handleTarget(){
            
            print("kola")
            guard let name = NameTextField.text else {return}
            guard let email = EmailTextFiled.text else {return}
            guard let job = JobTitle.text else {return}
            
            let data = ["name":name,"email":email,"job":job]
            
            
            Database.database().reference().child("user").setValue(data) { (error, ref) in
                if let error = error {
                    print("error",error)
                    return
                }
                print("Success")
            }
            
            let controller = NextViewController()
            present(controller, animated: true, completion: nil)
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let stackView = UIStackView(arrangedSubviews: [
                NameTextField,
                EmailTextFiled,
                JobTitle,
                nextButton
                ])
            nextButton.addTarget(self, action: #selector(handleTarget), for: .touchUpInside)
            stackView.axis = .vertical
            
            stackView.distribution = .fillEqually
            view.addSubview(stackView)
            stackView.centerXInSuperview()
            stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 100, left: 20, bottom: 0, right: 20),size:.init(width: 0, height: 200))
            stackView.spacing = 10
            
            print("ok")

        }
        
        
    }
    





