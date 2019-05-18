//
//  CategoriesViewController.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/17/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - Properties
    var categories: [Category] = []
    let mockNetworking = MockNetworking()
    
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mockNetworking.decodeJSON(for: Category.self, fileName: Constants.jsonFileName.categories) { [weak self] data in
            switch data {
            case let .success(successData):
                self?.categories = successData
            case let .failure(error):
                print(error)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
        self.splitViewController?.preferredDisplayMode = .allVisible
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifier.showCategoryResorceList {
            if let categoryResorce = (segue.destination.innerViewController as? CategoryResorceListViewController) {
                if let cell = sender as? CategoryCollectionViewCell {
                    categoryResorce.category = cell.category
                    categoryResorce.updateUI()
                }
            }
        }
    }

}



// MARK: - UICollectionViewDataSource
extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.category, for: indexPath) as? CategoryCollectionViewCell {
            cell.category = categories[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}



// MARK: - UICollectionViewDelegate
extension CategoriesViewController: UICollectionViewDelegate {
}



// MARK: - UICollectionViewDelegateFlowLayout
extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewItemsPerRow: Int = 2
        let padding = Constants.Number.largePadding * (CGFloat(collectionViewItemsPerRow) + 1)
        let collectionViewWidth = view.frame.width - padding
        let widthPerItem = collectionViewWidth / CGFloat(collectionViewItemsPerRow)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.Number.largePadding
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.Number.largePadding, left: 0.0, bottom: 0.0, right: 0.0)
    }
}



// MARK: - UISplitViewControllerDelegate
extension CategoriesViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
