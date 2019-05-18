//
//  ResourceDetailViewController.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ResourceDetailViewController: UIViewController {

    var viewModel: ResourceDetailViewModel!
    let bag = DisposeBag()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.contentInset.top = view.layoutMargins.top
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [contactInfoView, addressesView])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private lazy var contactInfoView: ContactInformationView = {
        return ContactInformationView(frame: .zero)
    }()
    
    private lazy var addressesView: AddressesView = {
        return AddressesView(frame: .zero)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutMargins.top = 16
        setupViewHierarchy()
        setupConstraints()
        setupBindings()
        view.backgroundColor = UIColor.init(named: "OffWhite")
    }
    
    private func setupViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(view.safeAreaInsets)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView).inset(view.safeAreaInsets)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin).inset(view.layoutMargins.left + 8)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin).inset(view.layoutMargins.right + 8)
        }
    }
    
    private func setupDelegates() {
        contactInfoView.delegate = viewModel
        addressesView.delegate = viewModel
    }
    
    private func setupBindings() {
        viewModel.addressViewModels
            .subscribe(onNext: { [weak addressesView] addresses in
                addressesView?.models = addresses
            })
            .disposed(by: bag)
        
        viewModel.contactInfoViewModel
            .subscribe(onNext: { [weak contactInfoView] info in
                contactInfoView?.model = info
            })
            .disposed(by: bag)
        
        viewModel.selectedEmail
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] email in self?.composeEmail(email: email) })
            .disposed(by: bag)
        
        viewModel.selectedAddress
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] address in self?.showMap(query: address) })
            .disposed(by: bag)
        
        viewModel.selectedCoordinates
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] coordinates in self?.showMap(coordinates: coordinates) })
            .disposed(by: bag)
        
        viewModel.selectedCallPhoneNumber
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] number in self?.callNumber(number: number) })
            .disposed(by: bag)
        
        viewModel.selectedSmsPhoneNumber
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] number in self?.smsNumber(number: number) })
            .disposed(by: bag)
        
        viewModel.selectedWebsite
            .flatMap({ return $0 == nil ? Observable.empty() : Observable.just($0!) })
            .subscribe(onNext: { [weak self] url in self?.showWebsite(url: url) })
            .disposed(by: bag)
    }
    
    private func composeEmail(email: String) {
        
    }
    
    private func callNumber(number: String) {
        
    }
    
    private func smsNumber(number: String) {
        
    }
    
    private func showWebsite(url: String) {
        
    }
    
    private func showMap(coordinates: (Double, Double)) {
        
    }
    
    private func showMap(query: String) {
        
    }
}

