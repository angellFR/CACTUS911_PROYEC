//
//  HomeInteractor.swift
//  PRACTICA_CACTUS911
//
//  Created Administrator on 02/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Alamofire

class HomeInteractor: NSObject, URLSessionDelegate,URLSessionDataDelegate {
    //MARK: - Protocol Properties
    weak var presenter: HomePresenterProtocol?
    private var dataTask : URLSessionDataTask?
        private var responseData : Data = Data()
        private var httpResponse : HTTPURLResponse?
 
}

//MARK: - Interactor Methods
extension HomeInteractor: HomeInteractorProtocol {
    
//    func getInitData(type: Typee) {
//
//        let urlString = "https://swapi.py4e.com/api/\(type)"
//        print("urlString \(urlString)")
//        AF.request("https://swapi.py4e.com/api/\(type)").responseDecodable(of: Welcome.self) { infoDatos in
//            debugPrint("Response: \(infoDatos)")
//
//            if let json = infoDatos.value {
//                self.presenter?.info(informacion: json)
//
//            }
//
//        }
//
//
//    }
    func getInitData(type: Typee){
            
            let urlString = "https://swapi.py4e.com/api/\(type)"
            guard let url = URL(string: urlString) else {return}
            var  request = URLRequest(url: url)
            request.timeoutInterval = 90
            request.httpMethod = "GET"
                print("urlString:::: \(urlString)")
        
            let sessionConfoguration = URLSessionConfiguration.default
            let defaultSession = URLSession(configuration: sessionConfoguration, delegate: self, delegateQueue: OperationQueue.main)
            
            dataTask = defaultSession.dataTask(with: request)
            dataTask?.resume()
            responseData = Data()
        }
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
            if error == nil{
                if httpResponse?.statusCode == 200{
                    let response = String(data: responseData, encoding: String.Encoding.utf8)
                    if let _ = response{
                        do{
                            let responseLogin = try
                            JSONDecoder().decode(Welcome.self, from: responseData)
                            print("Respuesta Ok>>>>::::\(responseLogin)")
                            presenter?.info(informacion: responseLogin)
                            
                        }catch{
                            print("Error creando objetos \(error)")
                            
                        }
                    }else{
                        print("Error en crear string\(String(describing: error))")
                        
                    }
                    
                }else{
                    print("http diferente de 200\(String(describing: error))")
                    
                }
            }else{
                print("El error no fue nil\(String(describing: error))")
              
            }
        }
        
        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
            responseData.append(data)
        }
      
        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
            httpResponse = response as? HTTPURLResponse
            completionHandler(URLSession.ResponseDisposition.allow)
        }
}