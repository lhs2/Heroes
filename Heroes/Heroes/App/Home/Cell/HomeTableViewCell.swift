//
//  HomeTableViewCell.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 13/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import Nuke

class HomeTableViewCell: UITableViewCell {


    @IBOutlet weak var pictureImageView: UIImageView!
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
    
    func configureCell(with character: Character) {
        if let characterName = character.name {
            titleLabel.text = characterName
        }
        
        if let picturePath = URL(string: character.getThumbnailPath()) {
            ImagePipeline.shared.loadImage(
                with: picturePath,
                progress: nil) {
                    response, error in
                    if error == nil {
                        self.pictureImageView.image = response?.image
                        self.pictureImageView.contentMode = .scaleAspectFit
                    }
                    
            }
        }
        
        setupBorder()
    }
    
    func setupBorder() {
        let borderColor: UIColor = #colorLiteral(red: 0.231372549, green: 0.3450980392, blue: 0.4745098039, alpha: 1)
        
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = titleLabel.bounds.height/3
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.shadowOffset = CGSize(width: -1, height: 2)
        titleLabel.layer.borderColor = borderColor.cgColor
        
        pictureImageView.layer.masksToBounds = true
        pictureImageView.layer.cornerRadius = pictureImageView.bounds.height/2
        pictureImageView.layer.borderWidth = 2
        pictureImageView.layer.shadowOffset = CGSize(width: -1, height: 2)
        pictureImageView.layer.borderColor = borderColor.cgColor
    }
    
    
}
