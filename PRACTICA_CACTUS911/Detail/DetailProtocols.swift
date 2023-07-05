//
//  DetailProtocols.swift
//  PRACTICA_CACTUS911
//
//  Created Administrator on 04/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol DetailWireframeProtocol: AnyObject {

}
//MARK: Presenter -
protocol DetailPresenterProtocol: AnyObject {
    func inforDetail(detail: Result)
}

//MARK: Interactor -
protocol DetailInteractorProtocol: AnyObject {

  var presenter: DetailPresenterProtocol?  { get set }
}

//MARK: View -
protocol DetailViewProtocol: AnyObject {
    func inforDetail(detail: Result)
  var presenter: DetailPresenterProtocol?  { get set }
}
