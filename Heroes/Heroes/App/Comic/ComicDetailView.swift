//
//  ComicDetailView.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 20/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke

class ComicDetailView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .comicDetail
    var viewModel : ComicDetailViewModel?
    let disposeBag = DisposeBag()
    
    // MARK: - Outlet
    @IBOutlet weak var comicView: UIImageView!
    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var comicDescription: UILabel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let viewModel = viewModel {
            viewModel.requestList()
        }
        setupCallBack()
    }
    
    func setupCallBack() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.isSuccess.asObservable()
            .bind { value in
                if value {
                    self.setupUI()
                }
        }.disposed(by: disposeBag)
        
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                if !errorMessage.isEmpty {
                    self.alert(title: "Error", error: errorMessage, buttonTexts: ["OK"])
                    self.comicTitle.text = "\(errorMessage) \n Try with another character."
                }
        }.disposed(by: disposeBag)
        
    }
    
    func setupUI() {
        guard let viewModel = viewModel else { return }
        comicTitle.text = viewModel.characterName
        comicDescription.text = viewModel.characterDescription
        loadImage(with: viewModel.characterImagePath)
    }
    
    private func loadImage(with path: String) {
        if let picturePath = URL(string: path) {
            ImagePipeline.shared.loadImage(
                with: picturePath,
                progress: nil) {
                    response, error in
                    if error == nil {
                        self.comicView.image = response?.image
                        self.comicView.contentMode = .scaleAspectFit
                    }
                    
            }
        }
    }

}
