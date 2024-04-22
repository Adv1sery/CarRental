//
//  DetailsViewController.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 15/4/24.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    private lazy var upView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var detailTableView: UITableView = {
        let view = UITableView()
        view.register(DetailsTableCell.self,
                      forCellReuseIdentifier: DetailsTableCell.reuId)
        view.layer.cornerRadius = 15
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.separatorColor = .lightGray
        view.separatorInset = UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16)
        
        view.delegate = self
        view.dataSource = self
        return view
    }()

    var detail: Details?
//    var cars: [carss] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
//    MARK: Gradient backGround
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor.gray.cgColor,
                                UIColor.darkGray.cgColor,
                                UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupUI() {
        view.addSubview(upView)
        
        upView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(350)
        }
        
        view.addSubview(detailTableView)
        
        detailTableView.snp.makeConstraints { make in
            make.top.equalTo(upView.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableCell.reuId,
                                                       for: indexPath) as? DetailsTableCell else {
            fatalError("Cannot dequeue DetailsTableCell")
        }
        
        if let detail = detail {
            cell.configure(with: detail)
        }
        
        return cell
    }
}
