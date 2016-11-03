//
//  UserIdentityViewController.swift
//  MySampleApp
//
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.4
//

import Foundation
import UIKit
// import AWSMobileHubHelper

class UserIdentityViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let identityManager = AWSIdentityManager.defaultIdentityManager()
        
        if let identityUserName = identityManager.userName {
            userName.text = identityUserName
        } else {
            userName.text = NSLocalizedString("Guest User", comment: "Placeholder text for the guest user.")
        }
        
        userID.text = identityManager.identityId
        if let imageURL = identityManager.imageURL {
            let imageData = NSData(contentsOfURL: imageURL)!
            if let profileImage = UIImage(data: imageData) {
                userImageView.image = profileImage
            } else {
                userImageView.image = UIImage(named: "UserIcon")
            }
        }
    }
}
