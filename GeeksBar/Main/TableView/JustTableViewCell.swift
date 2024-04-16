//
//  CustomTableViewCell.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 12/4/24.
//

import UIKit
import SnapKit

class JustTableViewCell: UITableViewCell {
    
    private lazy var carsStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        return view
    }()
    
    lazy var brandLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.textColor = .white
        return view
    }()
    
    lazy var modelLabel: UILabel = {
        let view = UILabel()
        view.text = "911 GT3 RS"
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textColor = .white
        return view
    }()
    
    lazy var descStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        return view
    }()
    
    lazy var yearLabel: UILabel = {
        let view = UILabel()
        view.text = "2024"
        view.textColor = .lightGray
        return view
    }()
    
    lazy var fuelLabel: UILabel = {
        let view = UILabel()
        view.text = "Gasoline"
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var arrowImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .arrow)
        return view
    }()
    
    static let reusId = "reusID"
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super .init(style: style,
                    reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(arrowImage)
        
        arrowImage.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
            
        }
        
        contentView.addSubview(carsStack)
        carsStack.addArrangedSubview(brandLabel)
        carsStack.addArrangedSubview(modelLabel)
        
        carsStack.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.top.equalTo(contentView.snp.top).offset(25)
        }
        
        contentView.addSubview(descStack)
        descStack.addArrangedSubview(yearLabel)
        descStack.addArrangedSubview(fuelLabel)
        
        descStack.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.top.equalTo(carsStack.snp.bottom).offset(15)
        }
    }
}
