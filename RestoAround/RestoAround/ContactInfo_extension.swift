//
//  ContactInfo_extension.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import SwiftyJSON

extension ContactInfo {
    
    init(json:JSON){
        
        let temp = json["contactInfo"].arrayValue
        let temp2 = temp[1]
        
        self.url = temp2["Attribute"].string
    }
    
}
