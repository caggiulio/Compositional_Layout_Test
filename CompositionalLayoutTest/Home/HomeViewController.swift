//
//  HomeViewController.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displaySomething(viewModel: Home.Something.ViewModel)
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
        
    }
    
    // MARK: - User interactions
    
    // MARK: - Private methods

}

// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayLogic {

    func displaySomething(viewModel: Home.Something.ViewModel) {

    }

}
