//
//  MovieCollectionCell.swift
//  MovApp
//
//  Created by Luis Mejías on 2/1/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation
import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var artistImageView: UIImageView!
    @IBOutlet private weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.backgroundColor = GColors.clearColor.cgColor
        layer.borderColor = GColors.textColor.cgColor
    }
    
    func configureCell(with artistData: Artist) {
        artistNameLabel.text = artistData.artistName
        artistNameLabel.textColor = GColors.textColor
    }
    
    
}
