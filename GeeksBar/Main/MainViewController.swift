//
//  MainViewController.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 8/4/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var justCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.minimumInteritemSpacing = 20
        let view = UICollectionView (frame: .zero,
                                     collectionViewLayout: layout)
        view.register(JustCollectionViewCell.self,
                      forCellWithReuseIdentifier: JustCollectionViewCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var justTableView: UITableView = {
        let view = UITableView()
        view.separatorInset = UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16)
        view.register(JustTableViewCell.self,
                      forCellReuseIdentifier: JustTableViewCell.reusId)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .darkGray
        view.separatorColor = .lightGray
        view.layer.cornerRadius = 15
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private let mainGeeksBar = MainView(frame: .zero)
    
    var cars: [carss] = []
    
    let urlCars = "https://freetestapi.com/api/v1/cars"
    
    override func loadView() {
        super.loadView()
        view = mainGeeksBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollView()
        setupTableView()
        getCars()
        setupNavigationItem()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = mainGeeksBar.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor.gray.cgColor,
                                UIColor.darkGray.cgColor,
                                UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        mainGeeksBar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func getCars() {
        
        guard let url = URL(string: urlCars) else {
            
            print("fail")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error fetching data \(error)")
                return
            }
            
            guard let data = data else {
                print("no data recieved")
                return
            }
            
            do {
                self.cars = try JSONDecoder().decode([carss].self, from: data)
                
                DispatchQueue.main.async { [ weak self ] in
                    guard let self = self else { return }
                    self.justTableView.reloadData()
                }
                
            } catch {
                print ("error fetching data \(error)")
            }
        }.resume()
    }
    
    private func setupUI() {
        mainGeeksBar.onNavItemTapped = { [ weak self ] in
            guard let self = self else { return }
        }
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Home"
        navigationItem.hidesBackButton = true
    }
    
    private func setupCollView() {
        view.addSubview(justCollectionView)
        
        justCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainGeeksBar.justSearchBar.snp.bottom).offset(20)
            make.leading.equalTo(mainGeeksBar.snp.leading).offset(16)
            make.trailing.equalTo(mainGeeksBar.snp.trailing)
            make.height.equalTo(40)
        }
    }
    
    private func setupTableView() {
        view.addSubview(justTableView)
        
        justTableView.snp.makeConstraints { make in
            make.top.equalTo(justCollectionView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(mainGeeksBar.safeAreaLayoutGuide.snp.bottom).offset(-15)
        }
    }
}

// MARK: CollectionView extensions

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustCollectionViewCell.reuseId,
                                                      for: indexPath) as! JustCollectionViewCell
        
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: TableView extensions

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let car = cars[indexPath.row]
        
        let detail = Details(id: car.id,
                             make: car.make,
                             model: car.model,
                             year: car.year,
                             color: car.color,
                             mileage: car.mileage,
                             price: car.price,
                             fuelType: car.fuelType,
                             transmission: car.transmission,
                             engine: car.engine,
                             horsepower: car.horsepower,
                             features: car.features,
                             owners: car.owners,
                             image: car.image)
        
        let detailsVC = DetailsViewController()
        detailsVC.detail = detail
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JustTableViewCell.reusId,
                                                       for: indexPath) as? JustTableViewCell else {
            fatalError("Cannot dequeue JustTableViewCell")
        }
        let car = cars[indexPath.row]
        
        cell.brandLabel.text = car.make
        cell.modelLabel.text = car.model
        cell.yearLabel.text = "\(car.year)"
        cell.fuelLabel.text = car.fuelType
        
        return cell
    }
}
