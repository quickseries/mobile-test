//
//  ResourceDetailRowCollectionViewCell.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

protocol ResourceDetailRowCollectionViewCellProtocol: class {
    func openMail(url: URL)
}

class ResourceDetailRowCollectionViewCell: UICollectionViewCell {
    
    
    
    // MARK: - Properties
    var resourceDetail: ResourceDetailViewModel! {
        didSet {
            self.rowTitle.text = resourceDetail.title
        }
    }
    weak var delegate: ResourceDetailRowCollectionViewCellProtocol!
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var rowTitle: UILabel!
    @IBOutlet weak var rowCollectionView: UICollectionView!
    

    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        rowCollectionView.dataSource = self
        rowCollectionView.delegate = self
        let nib = UINib(nibName: Constants.NibName.resourceInformationCell, bundle: nil)
        rowCollectionView.register(nib, forCellWithReuseIdentifier: Constants.CellIdentifier.resourceInformation)
    }
    
}



// MARK: - UICollectionViewDataSource
extension ResourceDetailRowCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resourceDetail.resourceInformations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.resourceInformation, for: indexPath) as? ResourceInformationCollectionViewCell {
            cell.resourceInformation = resourceDetail.resourceInformations[indexPath.row]
            cell.delegate = self
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}



// MARK: - UICollectionViewDelegate
extension ResourceDetailRowCollectionViewCell: UICollectionViewDelegate {

}



// MARK: - UICollectionViewDelegateFlowLayout
extension ResourceDetailRowCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 4) * 3, height: Constants.Number.resourceInformationRowHieght)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.Number.smallPadding
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: Constants.Number.largePadding, bottom: 0.0, right: Constants.Number.largePadding)
    }
}



// MARK: ResourceInformationCollectionViewCellDelegate
extension ResourceDetailRowCollectionViewCell: ResourceInformationCollectionViewCellDelegate {
    func openMail(url: URL) {
        delegate.openMail(url: url)
    }
}
