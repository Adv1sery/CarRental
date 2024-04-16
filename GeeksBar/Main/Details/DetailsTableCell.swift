//
//  DetailsCustomTableCell.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 16/4/24.
//

import UIKit
import SnapKit

class DetailsTableCell: UITableViewCell {
    
    private var makeLabel = UILabel()
    private var modelLabel = UILabel()
    private var yearLabel = UILabel()
    private var colorLabel = UILabel()
    private var mileageLabel = UILabel()
    private var fuelTypeLabel = UILabel()
    private var transmissionLabel = UILabel()
    private var engineLabel = UILabel()
    private var horsepowerLabel = UILabel()
    private var featuresLabel = UILabel()
    private var ownersLabel = UILabel()
    
    static let reuId = "detailId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI () {
        addLabelsToContentView()
    }
    
    private func addLabelsToContentView() {
        let labels = [
            makeLabel, modelLabel, yearLabel, colorLabel,
            mileageLabel, fuelTypeLabel, transmissionLabel,
            engineLabel, horsepowerLabel, featuresLabel,
            ownersLabel
        ]
        labels.forEach { label in
            contentView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false // Включение Auto Layout для меток
        }
    }
    
    private func setupConstraints() {
        contentView.addSubview(makeLabel)
        contentView.addSubview(modelLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(colorLabel)
        contentView.addSubview(mileageLabel)
        contentView.addSubview(fuelTypeLabel)
        contentView.addSubview(transmissionLabel)
        contentView.addSubview(engineLabel)
        contentView.addSubview(horsepowerLabel)
        contentView.addSubview(featuresLabel)
        contentView.addSubview(ownersLabel)
        
        makeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        modelLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        mileageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        fuelTypeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        transmissionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        engineLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        horsepowerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        featuresLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
        ownersLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }
        
    }
    
    func configure(with detail: Details) {
        makeLabel.text = detail.make
        modelLabel.text = detail.model
        yearLabel.text = "\(detail.year)"
        colorLabel.text = detail.color
        mileageLabel.text = "\(detail.mileage)"
        fuelTypeLabel.text = detail.fuelType
        transmissionLabel.text = detail.transmission
        engineLabel.text = detail.engine
        horsepowerLabel.text = "\(detail.horsepower)"
        featuresLabel.text = detail.features.joined(separator: ", ")
        ownersLabel.text = "\(detail.owners)"
    }
    
}
