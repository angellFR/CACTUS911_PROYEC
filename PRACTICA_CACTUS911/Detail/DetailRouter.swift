//
//  DetailRouter.swift
//  PRACTICA_CACTUS911
//
//  Created Administrator on 04/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailRouter {
    //MARK: - Protocol Properties
    weak var viewController: UIViewController?
    
    //MARK: - Static Methods
    static func createModule(detail: Result) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = DetailViewController(nibName: nil, bundle: nil)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router)
        presenter.inforDetail(detail: detail)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

//MARK: - Router Metods
extension DetailRouter: DetailWireframeProtocol {
    
}

//MARK: - Private functions
extension DetailRouter {
    
}
