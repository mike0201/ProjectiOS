//
//  ViewController.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myWebViewHeight: NSLayoutConstraint!
    @IBOutlet weak var maMap: MKMapView!
    private var position = Position()
    
    private var tab = [Resto]()
    private var notifyButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var latitude=""
        var longitude=""
        
        position.getLocation { (position) in
            latitude = position[0]
            longitude = position[1]
            NetworkManager.getRestos(latitude, long: longitude, completion: { (restos) in
                self.tab = restos
                for resto in self.tab{
                    
                    let annotation = MyAnnotation(coordinate: CLLocationCoordinate2DMake(CLLocationDegrees(resto.coordinate.lat), CLLocationDegrees(resto.coordinate.lng)), title: resto.name, subtitle: nil,url: resto.urlDetail)
                    self.maMap.addAnnotation(annotation)
                    
                    
                    
                }

            })
        }
        
        maMap.showsUserLocation = true
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "annotation"
        let annotationCoordinate = annotation.coordinate
        let userLocationCoordinate = mapView.userLocation.coordinate
        
        
        
        if annotationCoordinate.latitude == userLocationCoordinate.latitude && annotationCoordinate.longitude == userLocationCoordinate.longitude {
            return nil
        }
        var annot = annotation as! MyAnnotation
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier)
        if annotationView==nil {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pinAnnotationView.animatesDrop = true
            annotationView = pinAnnotationView
        }
        annotationView?.canShowCallout = true
        notifyButton.setTitle("notifier", forState: .Normal)
        notifyButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        notifyButton.frame = CGRectMake(0, 0, 100, 50)
        annotationView?.rightCalloutAccessoryView = notifyButton
                return annotationView
        
        
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let localNotification = UILocalNotification()
        localNotification.alertTitle = "Réservation du restaurant"
        localNotification.alertBody = "Vous devriez réserver ce restaurant"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        
    }
    func mapView(mapView: MKMapView, didUpdateUserLocation
        userLocation: MKUserLocation) {
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
    } 

    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        
        var annotation = view.annotation as! MyAnnotation
        
        self.myWebViewHeight.constant = 200
        
        if let url = annotation.url{
            
            
            // crash ici car le parsing JSon est mauvais du detail je ne l'ai vu que trop tard q'uil fallait parser
            
            NetworkManager.getDetail(url, completion: { (url) in
                if let Url = NSURL(string: url){
                    self.myWebView.loadRequest(NSURLRequest(URL: Url))
                }
            })
            
            UIView.animateWithDuration(0.9, animations: { self.view.layoutIfNeeded()
            })
        }
        
        
    }
    func mapView(mapView: MKMapView, didDeselectAnnotationView view: MKAnnotationView) {
        self.myWebViewHeight.constant = 0
    }


}

