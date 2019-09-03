//
//  NexViewController.swift
//  finalProject
//
//  Created by Fuad Hasan on 29/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit
import Firebase

class NextViewController :UIViewController {
    
    let name:UILabel = {
        
        let name = UILabel()
        name.text = "name"
        return name
    }()
    
    let email : UILabel = {
        let email = UILabel()
        email.text = "email"
        return email
    }()
    
    let job:UILabel = {
        let job = UILabel()
        job.text = "job"
        return job
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [name,email,job])
        view.addSubview(stackView)
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 100, left: 12, bottom: 12, right: 12),size: .init(width: view.frame.width, height: 100))
        
        
        Database.database().reference().child("user").observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let value = snapshot.value as? [String:Any] else {return}
            
            
            self.name.text = value["name"]  as? String
            self.email.text = value["email"]  as? String
            self.job.text = value["job"]  as? String
            
        }) { (error) in
            print("ez error")
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handle)))
        
    }
    @objc func handle (){
        self.dismiss(animated: true, completion: nil)
    }
}
