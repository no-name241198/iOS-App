//
//  TavbleViewCell.swift
//  SampleApp
//
//  Created by Ryota on 2020/12/30.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var darkGrayView: UIView!
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        darkGrayView.backgroundColor = highlighted ? .darkGray : .clear
        darkGrayView.alpha = highlighted ? 0.2 : 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        darkGrayView.backgroundColor = selected ? .darkGray : .clear
        darkGrayView.alpha = selected ? 0.2 : 1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(article: Article) {
        titleLabel.text = article.title
        idLabel.text = article.userId
    }
}
