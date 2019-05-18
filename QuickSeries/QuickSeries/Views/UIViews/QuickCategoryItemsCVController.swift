//
//  QuickCategoryItemsCVController.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import UIKit

class QuickCategoryItemsCVController: UICollectionViewController {
    
    
     var selectedCell = QuickCategoryItemCVCell()
    let transition = TransitionAnimator()
    var categoryViewModel : CategoryViewModel!
    private var categoryItemsviewModel :CategoryItemViewModels!
    private var dataSource : QuickCollectionViewDataSource<QuickCategoryItemCVCell, CategoryItemViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUIValues()
        
    }
    
    
    
    private func initUIValues() {
        
      
        
        
        
        self.title = categoryViewModel.category.title ?? ""
        
        self.categoryItemsviewModel = CategoryItemViewModels(queryParams: categoryViewModel.category.eid ?? "")
        
        self.categoryItemsviewModel.bindSourceToModels = {
            
            self.updateDataSource()
        }
        self.collectionView.delegate = self
        decorateUI()
        
        
    }
    
    func decorateUI(){
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
            
        } else {
            // Fallback on earlier versions
        }
        
        let sortBarButton = UIBarButtonItem.init(
            title: "Sort",
            style: .done,
            target: self,
            action: #selector(sortAction(sender:))
        )
        self.navigationItem.rightBarButtonItem = sortBarButton
        
        
        transition.dismissCompletion = {
            self.selectedCell.isHidden = false
        }
    }
    
    @objc func sortAction(sender: Any){
        
        self.categoryItemsviewModel.sortItems()
    }
    
    private func updateDataSource() {
        
        self.dataSource = QuickCollectionViewDataSource(cellIdentifier: Cells.categoryItemsCell, items: self.categoryItemsviewModel.categoryItemViewModels) { cell, category in
            
            
            cell.title.text = category.categoryItem.title
            cell.descriptionLabel.text = category.categoryItem.description?.htmlToString
            cell.icon.setImage(url: category.categoryItem.photo ?? "")
            
        }
        
        self.collectionView.dataSource = self.dataSource
        self.collectionView.reloadData()
    }
    
    
    
    
    
}

extension QuickCategoryItemsCVController : UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColums: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets : CGFloat = 10
        let cellSpacing: CGFloat = 5
        
        
        return CGSize(width: (width / numberOfColums) - (xInsets + cellSpacing), height: 250)
        
        
        
    }
}


extension QuickCategoryItemsCVController {
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         selectedCell = collectionView.cellForItem(at: indexPath) as! QuickCategoryItemCVCell
        let detailView = self.storyboard?.instantiateViewController(withIdentifier: "QuickItemDetailVC") as! QuickItemDetailVC
       
        detailView.transitioningDelegate = self
        
        self.present(detailView, animated: true, completion: nil)
        
    }
}

extension QuickCategoryItemsCVController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = selectedCell.superview?.convert(selectedCell.frame, to: nil) else {
            return transition
        }
        transition.originFrame = originFrame
        transition.presenting = true
        selectedCell.isHidden = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}
