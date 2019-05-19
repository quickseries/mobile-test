//
//  MessageUtility.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

class MessageUtility: NSObject
{
    public static func show(error: AppError)
    {
        let title = "Error"
        var message = ""
        if let code =  error.statusCode {
            message = "\(error.localizedDescription) - code \(code)"
        } else {
        message = "\(error.localizedDescription)"
        }
     
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        AppUtility.getTopMostViewController()?.present(alertController, animated: true)
    }
    
    public static func show(message: String)
    {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        AppUtility.getTopMostViewController()?.present(alertController, animated: true)

    }

}
