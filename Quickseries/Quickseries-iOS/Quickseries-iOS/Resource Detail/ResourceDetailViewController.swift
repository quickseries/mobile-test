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
import MessageUI
import MapKit
import SafariServices

class ResourceDetailViewController: UIViewController {

    var viewModel: ResourceDetailViewModel! {
        didSet {
            setupDelegates()
        }
    }
    let bag = DisposeBag()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.contentInset.top = view.layoutMargins.top
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    private lazy var descriptionContainer: UIView = {
       return UIView(frame: .zero)
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.italicSystemFont(ofSize: 24)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, descriptionContainer, contactInfoView, addressesView])
        stack.axis = .vertical
        stack.spacing = 16
        stack.setCustomSpacing(stack.spacing * 2, after: imageView)
        stack.setCustomSpacing(stack.spacing * 2, after: descriptionContainer)
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
        descriptionContainer.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(view.safeAreaInsets)
        }
        imageView.snp.makeConstraints { make in
            make.width.equalTo(imageView.snp.height).multipliedBy(1.8) // 16:9 aspect ratio
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(descriptionContainer.layoutMargins)
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualTo(descriptionContainer).inset(descriptionContainer.layoutMargins)
            make.trailing.lessThanOrEqualTo(descriptionContainer).inset(descriptionContainer.layoutMargins)
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
        guard MFMailComposeViewController.canSendMail() else {
            showFeatureNotSupportedAlert()
            return
        }
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([email])
        mail.setMessageBody("", isHTML: true)
        present(mail, animated: true)
    }
    
    private func callNumber(number: String) {
        guard let number = URL(string: "tel://" + number), UIApplication.shared.canOpenURL(number) else {
            showFeatureNotSupportedAlert()
            return
        }
        UIApplication.shared.open(number)
    }
    
    private func smsNumber(number: String) {
        guard MFMessageComposeViewController.canSendText() else {
            showFeatureNotSupportedAlert()
            return
        }
        let sms = MFMessageComposeViewController()
        sms.messageComposeDelegate = self
        sms.recipients = [number]
        present(sms, animated: true)
    }
    
    private func showWebsite(url: String) {
        guard let url = URL(string: url) else {
            showFeatureNotSupportedAlert(message: "Invalid URL")
            return
        }
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.preferredControlTintColor = UIApplication.shared.keyWindow?.tintColor
        present(safariViewController, animated: true)
    }
    
    private func showMap(coordinates: (Double, Double)) {
        let coords = CLLocationCoordinate2D(latitude: coordinates.0, longitude: coordinates.1)
        let placemark = MKPlacemark(coordinate: coords)
        let item = MKMapItem(placemark: placemark)
        item.name = title
        item.openInMaps()
    }
    
    private func showMap(query: String) {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "http://maps.apple.com/?q=" + encodedQuery),
            UIApplication.shared.canOpenURL(url) else {
                showFeatureNotSupportedAlert(message: "Invalid URL")
                return
        }
         UIApplication.shared.open(url)
    }
    
    private func showFeatureNotSupportedAlert(message: String = "Your device does not support this feature") {
        let alert = UIAlertController(title: "Failure", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Discard", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension ResourceDetailViewController : MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
}
