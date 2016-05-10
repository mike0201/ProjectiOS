//
//  Forme.swift
//  DrawFigureColored
//
//  Created by student5310 on 11/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit

class Forme: NSObject {
    
    var bezierPath:UIBezierPath
    var color:UIColor
    
    init(path:UIBezierPath,color:UIColor) {
        self.bezierPath=path
        self.color=color
    }

}
