//
//  GeeksBarView.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 6/4/24.
//

import UIKit
import SnapKit

class GeeksBarView: UIView {
    
    private lazy var mainImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .car)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var loginTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Login"
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        return view
    }()
    
    lazy var passwordTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        return view
    }()
    
    lazy var letsGobutton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Let's Go", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(vc), for: .touchUpInside)
        return view
    }()
    
    var didLetsGoTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(mainImg)
        
        mainImg.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-50)
            make.leading.equalTo(snp.leading).offset(-77)
            make.height.width.equalTo(450)
        }
        
        addSubview(loginTf)
        
        loginTf.snp.makeConstraints { make in
            make.top.equalTo(mainImg.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(55)
        }
        
        addSubview(passwordTf)
        
        passwordTf.snp.makeConstraints { make in
            make.top.equalTo(loginTf.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(55)
        }
        
        addSubview(letsGobutton)
        
        letsGobutton.snp.makeConstraints { make in
            make.top.equalTo(passwordTf.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
    }
    
    @objc
    private func vc() {
        didLetsGoTapped?()
    }
    
}
