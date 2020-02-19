//
//  HomeTableViewCell.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 13/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Cell configuration
    func configureCell() {
        titleLabel.text = "No title available"
        titleLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        setupBorder()
    }
    
    func configureCell(with comic: Comic) {
        if let comicTitle = comic.title {
            titleLabel.text = comicTitle
        }
        
        setupBorder()
    }
    
    func setupBorder() {
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = titleLabel.bounds.height/3
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.shadowOffset = CGSize(width: -1, height: 2)
        let borderColor: UIColor = #colorLiteral(red: 0.231372549, green: 0.3450980392, blue: 0.4745098039, alpha: 1)
        titleLabel.layer.borderColor = borderColor.cgColor
    }
    
    
}
