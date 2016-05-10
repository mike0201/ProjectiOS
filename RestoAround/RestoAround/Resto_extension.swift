//
//  Resto_extension.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Resto{
    
    
    init(json:JSON){
        
        self.name = json["titleNoFormatting"].string
        self.urlDetail = json["detailUrl"].string
        self.lat = json["lat"].string
        self.long = json["lng"].string
        self.coordinate = Coordinates(json: json["loc"])
        
    }
    
    
}
