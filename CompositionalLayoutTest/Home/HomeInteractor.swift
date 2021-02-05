//
//  HomeInteractor.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeBusinessLogic {
    func doSomething(request: Home.Something.Request)
}

protocol HomeDataStore { }

class HomeInteractor: HomeDataStore {
    
    // MARK: - Architecture properties

    var presenter: HomePresentationLogic?

}

// MARK: - HomeBusinessLogic

extension HomeInteractor: HomeBusinessLogic {

    func doSomething(request: Home.Something.Request) {
        let response = Home.Something.Response()
        presenter?.presentSomething(response: response)
    }

}
