//
//  NotesCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {
    var noteStr: String?
    @IBOutlet weak var noteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(pViewModel: NotesCellViewViewModel, pIndex: Int) {
        self.noteStr = pViewModel.getNote(ForIndex: pIndex)
        guard let noteStr = self.noteStr else{
            return
        }
        self.noteLabel.text = noteStr
    }
}
