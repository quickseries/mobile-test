//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesViewController
//  Description      :   Controller to manange the categories from data store
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

class InfoViewController: UIViewController {
    var items: [ListViewModelItem] = []

    var rawData: [DetailLists] = []

    
    /// Mode of View
    ///
    /// - list: Intial screen with list of resources
    /// - detail: detail of selected resource
    enum Mode {
        case list,detail
    }
    
    var mode:Mode = .list

    @IBOutlet weak var tableView: UITableView!
    
  // MARK: View lifecycle

    override func viewDidLoad(){
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView(){
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
    }
    
}

//MARK: - UITableViewDataSource
extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.filter { mode == .list ? $0.type == .list : $0.type == .details }[indexPath.row]
        switch item.type {
        case .list:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
                cell.item = item
                return cell
            }
        case .noResult:
            return UITableViewCell()
        case .details:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].type == .details ? "" : items[section].sectionTitle
        
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


