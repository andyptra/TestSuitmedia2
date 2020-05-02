//
//  ListArticleCollectionViewCell.swift
//  testiOS
//
//  Created by andyptra on 5/2/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class ListArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var subView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    func setupUI() {
        let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
        subView.layer.borderColor = borderColor.cgColor
        subView.layer.shadowColor = UIColor.black.cgColor
        subView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        subView.layer.shadowOpacity = 0.2
        subView.layer.shadowRadius = 15.0
        subView.layer.cornerRadius = 15.0
        subView.layer.masksToBounds = true
        
        mainView.layer.backgroundColor = UIColor.clear.cgColor
        mainView.layer.isOpaque = false
    }
    
    class func nib() -> UINib {
        return UINib(nibName: "ListArticleCollectionViewCell", bundle: nil)
    }
}
