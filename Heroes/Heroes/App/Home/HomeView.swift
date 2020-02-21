//
//  HomeView.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 18/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NVActivityIndicatorView

class HomeView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .home
    
    var viewModel : HomeViewModel?
    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallBack()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "tableViewIdentifier"
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tableView.register(UINib(nibName: "HomeLoadingTableViewCell", bundle: nil), forCellReuseIdentifier: "LoadingCell")
    }
    
    func setupCallBack() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.isSuccess.asObservable()
            .bind { value in
                if value {
                    self.tableView.reloadData()
                }
        }.disposed(by: disposeBag)
        
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                if !errorMessage.isEmpty {
                    self.alert(title: "Error", error: errorMessage, buttonTexts: ["OK"])
                    print(errorMessage)
                    self.emptyMessage(message: "Can'f fetch character list")
                    
                }
        }.disposed(by: disposeBag)
        
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel, viewModel.rows > 0, section == 0 {
            return viewModel.rows
        }
        else if let viewModel = viewModel, viewModel.rows > 0, section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
            cell.accessibilityIdentifier = "homeCell\(indexPath.row)"
            guard let viewModel = viewModel, let comic = viewModel.getCharacterBy(indexPath.row) else {
                cell.configureCell()
                return cell
            }
            
            cell.configureCell(with: comic)
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! HomeLoadingTableViewCell
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let viewModel = viewModel, viewModel.rows > 0 {
            self.tableView.backgroundView = .none
            self.tableView.separatorStyle = .singleLine
            return 2
        }
        
        emptyMessage(message: "Requesting character list")
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if indexPath.section == 1, let cell = cell as? HomeLoadingTableViewCell {
            cell.configureCell()
            viewModel.requestPagination()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel, indexPath.section == 0 else { return }
        viewModel.setSelectedItem(by: indexPath.row)
    }
    
    fileprivate func emptyMessage(message:String) {
        let rect = CGRect(origin: CGPoint(x: 0, y :0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.tableView.backgroundView = messageLabel
        self.tableView.separatorStyle = .none
        
    }
    
}


