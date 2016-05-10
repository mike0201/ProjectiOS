//
//  Result_extension.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import Foundation
import SwiftyJSON

extension results{
    
    init(json:JSON){
        
        
        let datas = json["result"].arrayValue
        var tab = [Resto]()
        
        for data in datas {
            
            let valeur = Resto(json: data)
            
            tab.append(valeur)
            
        }
        self.resto = tab
        
        
        
    }
}
