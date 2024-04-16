//
//  CustomTabBar.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 11/4/24.
//

import UIKit
import SnapKit

final class CustomTabBar: UITabBar {
    
    private let qr = qrButton(type: .system)
    
    override func draw(_ rect: CGRect) {
        configureShape()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupTabBar()
        setupQrButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        barTintColor = .darkGray
        tintColor = .white
        unselectedItemTintColor = .gray
    }
    
    private func setupQrButton() {
        addSubview(qr)
        qr.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(snp.top)
            make.height.equalTo(snp.height).multipliedBy(0.6)
            make.width.equalTo(snp.height).multipliedBy(0.6)
        }
    }
    
}

extension CustomTabBar {
    
    private func configureShape() {
        let path = getTabBarPath()
    }
    
    private func getTabBarPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0,
                              y: 0))
        path.addLine(to: CGPoint(x: 100,
                                 y: 0))
        
        path.addArc(withCenter: CGPoint(x: frame.width / 2,
                                        y: 0),
                    radius: 25,
                    startAngle: .pi,
                    endAngle: .pi * 2,
                    clockwise: false)
        path.addLine(to: CGPoint(x: frame.width,
                                 y: 0))
        
        return path
    }
    
}
