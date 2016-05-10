//
//  NetworkManager.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    private var currentRequest : Request?
    typealias RestoResults = (restos:[Resto]) -> Void
    typealias DetailResult = (url:String) -> Void
    
    private static let sharedInstance = NetworkManager()
    
    
    private func getResto(lat:String, long:String, completion : RestoResults){
        
        
        if let request = currentRequest {
            request.cancel()
        }
        
        let url = "https://db.aroundmeapi.com/v3/categorysearch/restaurant?lat=\(lat)&lon=\(long)"
        
        currentRequest = Alamofire.request(.GET, url).responseJSON(completionHandler: { (response) in
            
            
            
            switch response.result {
                
            case .Success(let data):
                
                var restos = [Resto]()
                restos = JSONParser.parse(data)
                
                completion(restos: restos)
                
            case .Failure(let error):
                print(error)
                
            }
            
            
            
        })
        
    }
    private func getDetail(url:String, completion : DetailResult){
        
        
        if let request = currentRequest {
            request.cancel()
        }
        
        let url = url
        
        currentRequest = Alamofire.request(.GET, url).responseJSON(completionHandler: { (response) in
            
            
            
            switch response.result {
                
            case .Success(let data):
                
                var address = String()
                address = JSONParser.parseUrl(data)
                
                completion(url: address)
                
            case .Failure(let error):
                print(error)
                
            }
            
            
            
        })
        
    }
    
    internal static func getRestos(lat:String,long:String,completion:RestoResults){
        NetworkManager.sharedInstance.getResto(lat, long: long, completion: completion)
    }
    internal static func getDetail(url:String,completion:DetailResult){
        NetworkManager.sharedInstance.getDetail(url, completion: completion)    }
    
    
}

