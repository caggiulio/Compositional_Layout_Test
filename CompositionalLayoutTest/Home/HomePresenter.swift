//
//  HomePresenter.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomePresentationLogic {
    func presentFirstSection(response: Home.Something.Response)
    func presentSecondSection(response: Home.Something.Response)
    func presentThirdSection(response: Home.Something.Response)
}

class HomePresenter {

    // MARK: - Architecture properties

    weak var viewController: HomeDisplayLogic?
}

// MARK: - HomePresentationLogic

extension HomePresenter: HomePresentationLogic {
    func presentFirstSection(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel(sectionColors: response.sectionColors)
        viewController?.displayFirstSection(viewModel: viewModel)
    }
    
    func presentSecondSection(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel(sectionColors: response.sectionColors)
        viewController?.displaySecondSection(viewModel: viewModel)
    }
    
    func presentThirdSection(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel(sectionColors: response.sectionColors)
        viewController?.displayThirdSection(viewModel: viewModel)
    }
    
}
