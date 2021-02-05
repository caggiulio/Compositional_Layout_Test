//
//  HomeRouter.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


protocol HomeRoutingLogic {
    // func routeToSomewhere()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get set }
}

class HomeRouter: HomeDataPassing {

    // MARK: - Architecture properties

    weak var viewController: HomeViewController?

    // MARK: - Business properties

    var dataStore: HomeDataStore?

}

// MARK: - HomeRoutingLogic

extension HomeRouter: HomeRoutingLogic {

    // func routeToSomewhere() {
    //     let destinationVC = SomewhereViewController()
    //     var destinationDS = destinationVC.router!.dataStore!
    //     passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //     navigateToSomewhere(source: viewController!, destination: destinationVC)
    // }

}

// MARK: - Navigation methods

private extension HomeRouter {
    
    // func navigateToSomewhere(source: HomeViewController, destination: SomewhereViewController) {
    //     source.show(destination, sender: nil)
    // }

}

// MARK: - Passing data methods

private extension HomeRouter {
   
    // func passDataToSomewhere(source: HomeDataStore, destination: inout SomewhereDataStore) {
    //     destination.someObject = source.someObject
    // }

}
