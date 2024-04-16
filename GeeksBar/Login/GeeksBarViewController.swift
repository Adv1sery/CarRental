//
//  ViewController.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 4/4/24.
//

import UIKit
import SnapKit

class GeeksBarViewController: UIViewController {
    
    private let geeksBar = GeeksBarView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = geeksBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        geeksBar.didLetsGoTapped = {[ weak self ] in
            guard let self else { return }
            let vc = MainViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

