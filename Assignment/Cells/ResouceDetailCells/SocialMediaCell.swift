//
//  SocialMediaCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import SafariServices
class SocialMediaCell: UITableViewCell {
    var containerViewController : UIViewController?
    var viewModel :SocialMediaCellViewViewModel?
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBAction func fbButtonAction(_ sender: Any) {
            guard let viewController = self.containerViewController, let viewModel = self.viewModel, let url = viewModel.fbURL else {
                return
            }
            let svc = SFSafariViewController(url: url)
        
            viewController.present(svc, animated: true, completion: nil)
        

    }
    @IBAction func twitterButtonAction(_ sender: Any) {
        guard let viewController = self.containerViewController,let viewModel = self.viewModel, let url = viewModel.twitterURL else {
            return
        }
        let svc = SFSafariViewController(url: url)
        viewController.present(svc, animated: true, completion: nil)
    }
    @IBAction func youtubeButtonAction(_ sender: Any) {
        guard let viewController = self.containerViewController,let viewModel = self.viewModel, let url = viewModel.youTubeURL else {
            return
        }
        let svc = SFSafariViewController(url: url)
        viewController.present(svc, animated: true, completion: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(pContainerViewController:UIViewController, pViewModel: SocialMediaCellViewViewModel) {
        self.containerViewController = pContainerViewController
        self.viewModel = pViewModel
        self.fbButton.isEnabled = false
        self.twitterButton.isEnabled = false
        self.youtubeButton.isEnabled = false
        guard let vm = self.viewModel  else {
            return
        }
        self.fbButton.isEnabled = (vm.fbURL != nil)
        self.twitterButton.isEnabled = (vm.twitterURL != nil)
        self.youtubeButton.isEnabled = (vm.youTubeURL != nil)
    }
}
