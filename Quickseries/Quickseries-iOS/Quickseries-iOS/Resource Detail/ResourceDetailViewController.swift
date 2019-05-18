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
import Kingfisher

class ResourceDetailViewController: UIViewController {

    var viewModel: ResourceDetailViewModel!
    let bag = DisposeBag()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.contentInset.top = view.layoutMargins.top
        return scroll
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, contactInfoView, addressesView])
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
        setupFixedValues()
        setupBindings()
        view.backgroundColor = UIColor.init(named: "OffWhite")
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(view.safeAreaInsets)
        }
        imageView.snp.makeConstraints { make in
            make.width.equalTo(imageView.snp.height).multipliedBy(1.8) // 16:9 aspect ratio
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
    
    private func setupFixedValues() {
        if viewModel.addressViewModels.isEmpty {
            addressesView.removeFromSuperview()
        } else {
            addressesView.models = viewModel.addressViewModels
        }
        if let info = viewModel.contactInfoViewModel {
            contactInfoView.model = info
        } else {
            contactInfoView.removeFromSuperview()
        }
        if let url = URL(string: viewModel.image) {
            imageView.kf.setImage(with: url, options: [
                .transition(.fade(1)),
                .scaleFactor(UIScreen.main.scale)
                ])
        }
        title = viewModel.title
        descriptionLabel.text = viewModel.categoryDescription
    }
    
    private func setupBindings() {
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
        //TODO: Implement
    }
    
    private func callNumber(number: String) {
        //TODO: Implement
    }
    
    private func smsNumber(number: String) {
        //TODO: Implement
    }
    
    private func showWebsite(url: String) {
        //TODO: Implement
    }
    
    private func showMap(coordinates: (Double, Double)) {
        //TODO: Implement
    }
    
    private func showMap(query: String) {
        //TODO: Implement
    }
}

