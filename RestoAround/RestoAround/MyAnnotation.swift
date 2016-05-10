//
//  MyAnnotation.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var url:String?
    
    init(coordinate: CLLocationCoordinate2D,title:String?,subtitle: String?,url:String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.url = url
    }
    
}
