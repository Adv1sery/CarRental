//
//  JustCollectionViewCell.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 11/4/24.
//

import UIKit

class JustCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "reuseID"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .gray
    }
    
}
