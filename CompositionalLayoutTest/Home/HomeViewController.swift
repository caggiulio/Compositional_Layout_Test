//
//  HomeViewController.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayFirstSection(viewModel: Home.Something.ViewModel)
    func displaySecondSection(viewModel: Home.Something.ViewModel)
    func displayThirdSection(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController {
    
    // MARK: - Architecture properties

    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: - UI properties

    var _view: HomeView? {
        guard let view = view as? HomeView else { preconditionFailure("Unable to cast view to HomeView")}
        return view
    }
    
    var homeDataProvider: HomeDataProvider?

    // MARK: - Business properties

    // MARK: - Object lifecycle

    required init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.fetchFirstSection()
        self.fetchSecondSection()
        self.fetchThirdSection()
    }
    
    // MARK: - Setup methods

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Configure methods

    private func configureUI() {
        _view?.homeCollectionView.register(HomeSection1CollectionViewCell.self, forCellWithReuseIdentifier: "HomeSection1CollectionViewCell")
        _view?.homeCollectionView.register(HomeSection2CollectionViewCell.self, forCellWithReuseIdentifier: "HomeSection2CollectionViewCell")
        homeDataProvider = HomeDataProvider(collectionView: _view!.homeCollectionView)
    }
    
    // MARK: - User interactions
    
    func fetchFirstSection() {
        let request = Home.Something.Request()
        interactor?.fetchFirstSection(request: request)
    }
    
    func fetchSecondSection() {
        let request = Home.Something.Request()
        interactor?.fetchSecondSection(request: request)
    }
    
    func fetchThirdSection() {
        let request = Home.Something.Request()
        interactor?.fetchThirdSection(request: request)
    }
    
    // MARK: - Private methods

}

// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayLogic {
    func displayFirstSection(viewModel: Home.Something.ViewModel) {
        homeDataProvider?.firstSectionColorsDisplayed = viewModel.sectionColors
        homeDataProvider?.applySnapshot(homeEntries: HomeEntries(firstSection: viewModel.sectionColors))
    }
    
    func displaySecondSection(viewModel: Home.Something.ViewModel) {
        homeDataProvider?.secondSectionColorsDisplayed = viewModel.sectionColors
        homeDataProvider?.applySnapshot(homeEntries: HomeEntries(secondSection: viewModel.sectionColors))
    }
    
    func displayThirdSection(viewModel: Home.Something.ViewModel) {
        homeDataProvider?.thirdSectionColorsDisplayed = viewModel.sectionColors
        homeDataProvider?.applySnapshot(homeEntries: HomeEntries(thirdSection: viewModel.sectionColors))
    }

}
