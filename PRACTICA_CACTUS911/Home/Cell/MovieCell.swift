//
//  MovieCell.swift
//  PeliculasNewTiss
//
//  Created by Administrator on 20/04/23.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    let labelName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 15, weight: .bold, width: .condensed)
        } else {
            // Fallback on earlier versions
        }
        
        return label
    }()
    let labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
        } else {
            // Fallback on earlier versions
        }
        
        return label
    }()
    
    let labelFecha: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        return label
    }()
    
    let labelCalificacion: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "CellCollection")
        contentView.addSubview(labelName)
        contentView.addSubview(ImageView)
        contentView.addSubview(labelDescription)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelName.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 2, right: 10, bottom: nil, withAnchor: .top, relativeToView: ImageView)
        labelDescription.addAnchorsAndSize(width: width, height: nil, left: 5, top: 10, right: 10, bottom: nil, withAnchor: .top,relativeToView: labelName)
        ImageView.addAnchorsAndSize(width: nil, height: 250, left: 0, top: 0, right: 0, bottom: nil)
    }
    
    func configure(model: Result){
        
        labelName.text = model.name
        labelDescription.text = model.edited.description
        
        }
}
    

