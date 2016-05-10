//
//  Coordinate_extension.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Coordinates{
    
    init(json:JSON){
        self.lat=json[0].float
        self.lng=json[1].float
    }
    
}