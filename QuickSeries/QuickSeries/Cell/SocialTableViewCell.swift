//
//  SocialTableViewCell.swift
//  QuickSeries
//
//  Created by Parth Patel on 16/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func collectionView(cell: SocialCollectionViewCell?, index: Int, didTappedInTableViewCell: SocialTableViewCell, socialURL: String)
}

class SocialTableViewCell: UITableViewCell {

    weak var cellDelegate: CollectionViewCellDelegate?
    @IBOutlet var collectionView: UICollectionView!
    public var socialArray = [(String, String)]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 60, height: 60)
        flowLayout.minimumLineSpacing = 20.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let cellNib = UINib(nibName: String(describing: SocialCollectionViewCell.self), bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: String(describing: SocialCollectionViewCell.self))
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.frame = CGRect(x: 0.0, y: 0.0, width: targetSize.width, height: 90)
        self.collectionView.layoutIfNeeded()
        return self.collectionView.collectionViewLayout.collectionViewContentSize
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateDataSource(data: [(String, String)]) {
        socialArray = data
        self.collectionView.reloadData()
    }

}

extension SocialTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SocialCollectionViewCell
        self.cellDelegate?.collectionView(cell: cell, index: indexPath.item, didTappedInTableViewCell: self, socialURL: socialArray[indexPath.row].1)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.socialArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SocialCollectionViewCell.self), for: indexPath) as? SocialCollectionViewCell {
                cell.socialImageView.image = UIImage(named: socialArray[indexPath.row].0)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom:0, right: 0)
    }

}
