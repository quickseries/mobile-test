//
//  ContactInformationView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ContactInformationView: InformationView {
    
    weak var delegate: ContactInformationViewDelegate?
    
    override var fieldLabelText: String {
        get { return "CONTACT INFORMATION" }
        set { }
    }
    
    var model: ContactInformationViewModel? {
        didSet {
            addFields()
        }
    }
    
    private let bag = DisposeBag()
    
    //MARK: View Hierarchy Assembly
    
    private func addFields() {
        guard let model = model else {
            fieldsContainer.removeFromSuperview()
            return
        }
        if let phoneNumber = model.phoneNumber {
            let view = buildPhoneNumberFieldView(number: phoneNumber)
            containerStackView.addArrangedSubview(view)
        }
        if let faxNumber = model.faxNumber {
            let view  = buildFaxNumberFieldView(number: faxNumber)
            containerStackView.addArrangedSubview(view)
        }
        if let tollFree = model.tollFree {
            let view = buildTollFreeFieldView(number: tollFree)
            containerStackView.addArrangedSubview(view)
        }
        if let email = model.email {
            let view = buildEmailFieldView(email: email)
            containerStackView.addArrangedSubview(view)
        }
        if let website = model.website {
            let view = buildWebsiteFieldView(website: website)
            containerStackView.addArrangedSubview(view)
        }
    }
    
    //MARK: Field View Construction
    
    private func buildWebsiteFieldView(website: String) -> FieldView {
        let button = UIButton(type: .system)
        button.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onWebsiteClicked()
        }).disposed(by: bag)
        button.setImage(UIImage(named: "baseline_open_in_browser_black_24pt"), for: .normal)
        
        let view = WebsiteFieldView(buttons: [button])
        view.fieldValue.text = website
        
        return view
    }
    
    private func buildTollFreeFieldView(number: String) -> FieldView {
        let callButton = UIButton(type: .system)
        callButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onCallTollFreeClicked()
        }).disposed(by: bag)
        callButton.setImage(UIImage(named: "baseline_call_black_24pt"), for: .normal)
        
        let smsButton = UIButton(type: .system)
        smsButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onSmsTollFreeClicked()
        }).disposed(by: bag)
        smsButton.setImage(UIImage(named: "baseline_textsms_black_24pt"), for: .normal)
        
        let view = TollFreeFieldView(buttons: [smsButton, callButton])
        view.fieldValue.text = number
        
        return view
    }
    
    private func buildFaxNumberFieldView(number: String) -> FieldView {
        let view = FaxFieldView(buttons: [])
        view.fieldValue.text = number
        return view
    }
    
    private func buildPhoneNumberFieldView(number: String) -> FieldView {
        let callButton = UIButton(type: .system)
        callButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onCallPhoneNumberClicked()
        }).disposed(by: bag)
        callButton.setImage(UIImage(named: "baseline_call_black_24pt"), for: .normal)
        
        let smsButton = UIButton(type: .system)
        smsButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onSmsPhoneNumberClicked()
        }).disposed(by: bag)
        smsButton.setImage(UIImage(named: "baseline_textsms_black_24pt"), for: .normal)
        
        let view = TelephoneFieldView(buttons: [smsButton, callButton])
        view.fieldValue.text = number
        
        return view
    }
    
    private func buildEmailFieldView(email: String) -> FieldView {
        let button = UIButton(type: .system)
        button.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
            delegate?.onEmailClicked()
        }).disposed(by: bag)
        button.setImage(UIImage(named: "baseline_email_black_24pt"), for: .normal)
        
        let view = EmailFieldView(buttons: [button])
        view.fieldValue.text = email
        
        return view
    }
    
}

protocol ContactInformationViewDelegate : AnyObject {
    func onEmailClicked()
    func onCallTollFreeClicked()
    func onCallPhoneNumberClicked()
    func onSmsTollFreeClicked()
    func onSmsPhoneNumberClicked()
    func onWebsiteClicked()
}
