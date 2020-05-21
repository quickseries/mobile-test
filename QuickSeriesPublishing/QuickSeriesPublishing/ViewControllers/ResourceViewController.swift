//
//  ResourceViewController.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {
    @IBOutlet private weak var resourceTableView: UITableView!
    private var categoryId: String
    private var viewModel: ResourceViewModel?
    private var resources = [Resource]()
    
    public init(_ categoryId: String) {
        self.categoryId = categoryId
        super.init(nibName: String(describing: ResourceViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
           
    override func viewDidLoad() {
        super.viewDidLoad()
           
        viewModel = ResourceViewModel(categoryId: categoryId, interactor: ResourceInteractor())
        setTitle()
        setupTableView()
        fetchResources()
    }
}

private extension ResourceViewController {
    func setTitle() {
        self.title = "Resource"        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        guard let viewModel = viewModel else { return }
        
        viewModel.sort { [weak self] result in
            guard let strongSelf = self else { return }
            
            strongSelf.resources = result
            DispatchQueue.main.async {
                strongSelf.resourceTableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        resourceTableView.delegate = self
        resourceTableView.dataSource = self
        resourceTableView.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: String(describing: ResourceTableViewCell.self), bundle: Bundle(for: ResourceTableViewCell.self))
        resourceTableView.register(nib, forCellReuseIdentifier: String(describing: ResourceTableViewCell.self))
    }
    
    func fetchResources() {
        guard let viewModel = viewModel else { return }
        
        viewModel.fetch { [weak self] result in
            guard let strongSelf = self else { return }
            
            strongSelf.resources = result
            strongSelf.resourceTableView.reloadData()
        }
    }
}

extension ResourceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResourceTableViewCell.self), for: indexPath) as? ResourceTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(with: resources[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resource = resources[indexPath.item]
        let viewController = DetailResourceViewController(resource)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

