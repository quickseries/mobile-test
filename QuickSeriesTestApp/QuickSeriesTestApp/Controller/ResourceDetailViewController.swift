//
//  ResourceDetailViewController.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit
import MessageUI

class ResourceDetailViewController: UIViewController {
    
    // MARK: - Properties
    var resours: ResourceViewModel!
    var resourceDetails: [ResourceDetailViewModel] {
        return resours.resourceDetails
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet weak var resourceDescriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    // MARK: - Methods
    func updateUI() {
        if let resours = resours {
            title = resours.titleText
            if let url = resours.imageURL {
                resourceImageView?.downloadImageUsingCache(url: url)
            }
            resourceDescriptionLabel?.text = resours.descriptionText
        }
        updateSocialMediaButtons()
    }
    func updateSocialMediaButtons() {
        if resours.facebookURL == nil {
            facebookButton?.isEnabled = false
        }
        if resours.twitterURL == nil {
            twitterButton?.isEnabled = false
        }
        if resours.youtubeURL == nil {
            youtubeButton?.isEnabled = false
        }
    }
    
    
    
    // MARK: - Actions
    @IBAction func facebookButtonDidTapped(_ sender: UIButton) {
        // TODO:
        UIApplication.shared.open(resours.facebookURL!)
    }
    @IBAction func twitterButtonDidTapped(_ sender: UIButton) {
        // TODO:
        UIApplication.shared.open(resours.twitterURL!)
    }
    @IBAction func youtubeButtonDidTapped(_ sender: UIButton) {
        // TODO:
        UIApplication.shared.open(resours.youtubeURL!)
    }
    

}



// MARK: - UICollectionViewDataSource
extension ResourceDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resourceDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.resourceDetailRow, for: indexPath) as? ResourceDetailRowCollectionViewCell {
            cell.resourceDetail = resourceDetails[indexPath.row]
            cell.delegate = self
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}



// MARK: - UICollectionViewDelegate
extension ResourceDetailViewController: UICollectionViewDelegate {
 
}



// MARK: - UICollectionViewDelegateFlowLayout
extension ResourceDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: Constants.Number.resourceDetailRowHieght)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.Number.largePadding
    }
}



// MARK: ResourceDetailRowCollectionViewCellProtocol
extension ResourceDetailViewController: ResourceDetailRowCollectionViewCellProtocol, MFMailComposeViewControllerDelegate {
    func openMail(url: URL) {
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        self.present(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}

