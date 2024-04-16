//
//  QrButton.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 11/4/24.
//

import UIKit
import SnapKit

final class qrButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setImage(UIImage(systemName: "qrcode"), for: .normal)
        backgroundColor = .lightGray
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0,
                                    height: 6)
    }
    
}
