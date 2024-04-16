//
//  MainView.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 8/4/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var justSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.backgroundImage = UIImage()
        view.layer.cornerRadius = 10
        return view
    }()
    
    var onNavItemTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(justSearchBar)
        
        justSearchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
    }
    
    @objc
    private func vc() {
        onNavItemTapped?()
    }
    
}

