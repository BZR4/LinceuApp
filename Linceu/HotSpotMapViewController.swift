//
//  HotSpotMapViewController.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 02/06/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit
import MapKit

class HotSpotMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        mapView = MKMapView()
//    }
    
    /*  Nos temos um pino no mapa, fazer o zoom centralizar o mapa  */
    func setCenterOfMapToLoacation(location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }

    func addPinToMapView(){
        let location = CLLocationCoordinate2D(latitude: -22.357241057363566, longitude: -47.38393372007)
        
        /*  criar uma anotacao baseado na localizacao   */
        let annotation = MyAnnotation(coordinate: location, title: "Praça Barão de Araras", subtitle: "Centro")
        
        mapView.addAnnotation(annotation)
        
        /*  Centralizar o Mapa ao redor do pino */
        setCenterOfMapToLoacation(location)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("ViewDidLoad Carregada")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addPinToMapView()
    }
    
    @IBAction func openReport(sender: AnyObject) {
        performSegueWithIdentifier("report", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
