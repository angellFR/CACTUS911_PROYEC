//
//  DetailPresenter.swift
//  PRACTICA_CACTUS911
//
//  Created Administrator on 04/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailPresenter {
    //MARK: - Protocol Properties
    weak private var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    private let router: DetailWireframeProtocol

    //MARK: - Life Cycle
    init(interface: DetailViewProtocol, interactor: DetailInteractorProtocol?, router: DetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - Presenter Methods
extension DetailPresenter: DetailPresenterProtocol {
    func inforDetail(detail: Result) {
        view?.inforDetail(detail: detail)
    }
    
    
}

//MARK: - Private functions
extension DetailPresenter {
    
}
