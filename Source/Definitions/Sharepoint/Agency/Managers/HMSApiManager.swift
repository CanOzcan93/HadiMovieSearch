//
//  HMSApiManager.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON
import PromiseKit

open class HMSApiManager {
    
    public required init() {
        
    }
    
    private var sharepoint: HMSSharepoint!
    
    private var agency: HMSAgency!
    private var repository: HMSRepository!
    
    private var manager: HMSManager!
    
    private var eventManager: HMSEventManager!
    private var networkManager: HMSNetworkManager!
    
    private var dataStorage: HMSDataStorage!
    private var persistentStorage: HMSPersistentStorage!
    private var exchangeFlow: HMSExchangeFlow!
    
    public func injectDependencies() {

        sharepoint = HMSSharepoint.getInstance()
        agency = sharepoint.agency
        repository = sharepoint.repository
        manager =  agency.manager
        eventManager = manager.eventManager!
        networkManager = manager.networkManager!
        
        dataStorage = repository.dataStorage
        persistentStorage = repository.persistentStorage
        exchangeFlow = repository.exchangeFlow
        
    }
    
    private var currentRequestURL = ""
    private var currentPage = 0
    
    public func getList(pageNumber:Int=1) -> Promise<[Movie]> {
    
        return Promise() { seal in
            currentPage = pageNumber
            currentRequestURL = "http://api.themoviedb.org/3/discover/movie?api_key=2696829a81b1b5827d515ff121700838"
            Alamofire.request("\(currentRequestURL)&page=\(currentPage)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!).validate().responseJSON() { response in
                switch response.result {
                    case .success(let jsonData):
                        guard let jsonDict = jsonData as? [String:Any] else {
                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                        let json = JSON(jsonDict)
                        let decoder = JSONDecoder()
                        do {
                            let account = try decoder.decode([Movie].self, from: json["results"].rawData())
                            seal.fulfill(account)
                        } catch let error {
                            print("JSON Decode Error:\n \(error)")
                        }
                        
                    case .failure(let error):
                        seal.reject(error)
                }
            }
        }
    }
    
    public func searchList(pageNumber:Int=1, str: String) -> Promise<[Movie]> {
        return Promise() { seal in
            currentPage = pageNumber
            currentRequestURL = "http://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=\(str)"
            print(str,"\(currentRequestURL)&page=\(pageNumber)")
            Alamofire.request("\(currentRequestURL)&page=\(pageNumber)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!).validate().responseJSON() { response in
                switch response.result {
                    case .success(let jsonData):
                        guard let jsonDict = jsonData as? [String:Any] else {
                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                        let json = JSON(jsonDict)
                        let decoder = JSONDecoder()
                        do {
                            let account = try decoder.decode([Movie].self, from: json["results"].rawData())
                            seal.fulfill(account)
                        } catch let error {
                            print("JSON Decode Error:\n \(error)")
                        }
                        
                    case .failure(let error):
                        seal.reject(error)
                }
            }
        }
    }
    
    public func nextList() -> Promise<[Movie]> {
        
        return Promise() { seal in
            currentPage += 1
            Alamofire.request("\(currentRequestURL)&page=\(currentPage)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!).validate().responseJSON() { response in
                switch response.result {
                    case .success(let jsonData):
                        guard let jsonDict = jsonData as? [String:Any] else {
                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                        let json = JSON(jsonDict)
//                        print(json.rawString()!)
                        let decoder = JSONDecoder()
                        do {
                            let account = try decoder.decode([Movie].self, from: json["results"].rawData())
                            seal.fulfill(account)
                        } catch let error {
                            print("JSON Decode Error:\n \(error)")
                        }
                        
                    case .failure(let error):
                        seal.reject(error)
                }
            }
        }
    }
    
    public func getImages(movies:[Movie]) -> Promise<[UIImage?]> {
        var images = [UIImage?]()
        
        return Promise { seal in
            var count = 0
            for movie in movies {
                if let poster = movie.poster_path {
                    if let photoUrl = URL(string: "https://image.tmdb.org/t/p/w500\(poster)") {
                        if let photoData = try? Data(contentsOf: photoUrl)  {
                            if let photoImage = UIImage(data: photoData)  {
                                images.append(photoImage)
                            }
                            else {
                                images.append(nil)
                                print("Failed downloading photo: \(count) \n Because of Serialization Error")
                            }
                        }
                        else {
                            images.append(nil)
                            print("Failed downloading photo: \(count) \n Because of Invalid URL")
                        }
                    }
                    else {
                        images.append(nil)
                        print("Failed downloading photo: \(count) \n Because of Invalid URL")
                    }
                }
                else {
                    images.append(nil)
                    print("Failed downloading photo: \(count) \n Because of Not Exist URL")
                }
                count += 1
            }
            seal.fulfill(images)
        }
            
    }
        

}
