//
//  JSONParser.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser {
    
    static func parse(data:AnyObject) -> [Resto] {
        
        let json = JSON(data)
        var restos = [Resto]()
        
        let result = results(json: json)
        
        restos = result.resto
        
        return restos
    }
    static func parseUrl(data:AnyObject) -> String{
        let json = JSON(data)
        
        var url = String()
        let contactInfo = ContactInfo(json: json["result"])
        
        url = contactInfo.url
        
        return url
    }
    
    
}

