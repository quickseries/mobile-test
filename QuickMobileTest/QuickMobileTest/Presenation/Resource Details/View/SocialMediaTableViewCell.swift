//
//  SocialMediaTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import UIKit

class SocialMediaTableViewCell: UITableViewCell {

    @IBOutlet private weak var stackView: UIStackView! {
        didSet {
            stackView.alignment = .leading
            stackView.axis = .horizontal
            stackView.spacing = 15
        }
    }
    
    @IBOutlet private weak var buttonFacebook: UIButton! {
        didSet {
            buttonFacebook.isHidden = true
        }
    }
    @IBOutlet private weak var buttonTwitter: UIButton! {
        didSet {
            buttonTwitter.isHidden = true
        }
    }
    @IBOutlet private weak var buttonYouTube: UIButton! {
        didSet {
            buttonYouTube.isHidden = true
        }
    }
    
    private var socialMedias: [SocialMedia]?
    weak var delegate: ContactInfoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(with medias: [SocialMedia]) {
        self.socialMedias = medias
        let mediasTypes = medias.map{ $0.type }
        _ = mediasTypes.map { (type) -> Void in
            switch type {
            case .facebook: buttonFacebook.isHidden = false
            case .twitter: buttonTwitter.isHidden = false
            case .youtube: buttonYouTube.isHidden = false
            }
        }
    }
    
    @IBAction private func buttonFacebookTapped(_ sender: UIButton) {
        tappedButton(for: .facebook)
    }
    
    @IBAction private func buttonTwitterTapped(_ sender: UIButton) {
        tappedButton(for: .twitter)
    }
    
    @IBAction private func buttonYouTube(_ sender: UIButton) {
        tappedButton(for: .youtube)
    }
    
    private  func tappedButton(for type: SocailMediaType) {
        if let medias = socialMedias?.filter({ $0.type == type }), let media = medias.first {
            delegate?.tappedAction(with: .website, media: media)
        }
    }
}
