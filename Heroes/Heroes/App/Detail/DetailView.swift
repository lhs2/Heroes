//
//  DetailView.swift
//  Heroes
//
//  Created by Luiz Henrique de Sousa on 19/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke

class DetailView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .detail
    
    // MARK: - Outlet
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    
    var viewModel : DetailViewModel?
    let disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        setupBind()
    }
    
    private func setupUI() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.characterName
        descriptionLabel.text = viewModel.characterDescription
        loadImage(with: viewModel.characterImagePath)
        detailButton.layer.cornerRadius = 10.0
    }
    
    private func setupBind() {
        let _ = detailButton.rx.tap
            .asObservable()
            .subscribe(onNext: { _ in
                guard let viewModel = self.viewModel else { return }
                viewModel.showExpensiveComic()
            },
                       onError: nil,
                       onCompleted: nil,
                       onDisposed: nil)
    }
    
    private func loadImage(with path: String) {
        if let picturePath = URL(string: path) {
            ImagePipeline.shared.loadImage(
                with: picturePath,
                progress: nil) {
                    response, error in
                    if error == nil {
                        self.charImage.image = response?.image
                        self.charImage.contentMode = .scaleAspectFit
                    }
                    
            }
        }
    }
    
}
