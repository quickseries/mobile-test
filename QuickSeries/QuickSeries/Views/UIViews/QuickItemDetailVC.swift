//
//  QuickItemDetailVC.swift
//  QuickSeries
//
//  Created by Engineer 144 on 18/05/2019.
//

import UIKit

class QuickItemDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    
    @IBAction func dismissMe(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
