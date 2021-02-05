//
//  HomePresenter.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomePresentationLogic {
    func presentSomething(response: Home.Something.Response)
}

class HomePresenter {

    // MARK: - Architecture properties

    weak var viewController: HomeDisplayLogic?
}

// MARK: - HomePresentationLogic

extension HomePresenter: HomePresentationLogic {

    func presentSomething(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
}
