//
//  HomeInteractor.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

protocol HomeBusinessLogic {
    func fetchFirstSection(request: Home.Something.Request)
    func fetchSecondSection(request: Home.Something.Request)
    func fetchThirdSection(request: Home.Something.Request)
}

protocol HomeDataStore { }

class HomeInteractor: HomeDataStore {
    
    // MARK: - Architecture properties

    var presenter: HomePresentationLogic?
    
    var firstSectionColors = [ColorizedCell]()
    var secondSectionColors = [ColorizedCell]()
    var thirdSectionColors = [ColorizedCell]()

}

// MARK: - HomeBusinessLogic

extension HomeInteractor: HomeBusinessLogic {

    func fetchFirstSection(request: Home.Something.Request) {
        let response = Home.Something.Response(sectionColors: [ColorizedCell(backgroundColor: .systemRed), ColorizedCell(backgroundColor: .systemPink), ColorizedCell(backgroundColor: .systemBlue)])
        self.firstSectionColors.append(contentsOf: response.sectionColors)
        presenter?.presentFirstSection(response: response)
    }
    
    func fetchSecondSection(request: Home.Something.Request) {
        //SIMULATE WORKS...
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let response = Home.Something.Response(sectionColors: [ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random())])
            self.secondSectionColors.append(contentsOf: response.sectionColors)
            self.presenter?.presentSecondSection(response: response)
        }
    }
    
    func fetchThirdSection(request: Home.Something.Request) {
        //SIMULATE WORKS...
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let response = Home.Something.Response(sectionColors: [ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random()), ColorizedCell(backgroundColor: .random())])
            self.thirdSectionColors.append(contentsOf: response.sectionColors)
            self.presenter?.presentThirdSection(response: response)
        }
    }

}
