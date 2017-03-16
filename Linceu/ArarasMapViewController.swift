//
//  ArarasMapViewController.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 03/06/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit
import MapKit
import CoreData


class ArarasMapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {
    
    var artworks = [Artwork]()
    
    var controller: UIAlertController?
    var pass: String!
    var name: String!
    
    var titleCrime: String!
    var subTitleCrime: String!
    var descriptionCrime: String!
    var dateCrime: NSDate?
    
    var textFieldDate: UITextField!
    
    var currentController: UIViewController?
        
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    
    var newCoord:CLLocationCoordinate2D?
    
    //MARK: SearchBar
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setar posicao inicial a qual o mapa sera centralzado
        let initialLocation = CLLocation(latitude: -22.357241057363566, longitude: -47.38393372007)
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
        // Set TapGesture
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPress)
        
        loadCrimePins()
        
        mapView.addAnnotations(artworks)
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.locationInView(self.mapView)
        self.newCoord = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        self.selectCrime()
//        self.persistPin()
    }
    
    
    @IBAction func mapTypeChanged(sender: AnyObject) {
                
        switch mapTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            print("1")
            mapView.mapType = MKMapType.Standard
        case 1:
            print("2")
            mapView.mapType = MKMapType.Hybrid
        case 2:
            print("3")
            mapView.mapType = MKMapType.Satellite
        default:
            print("")
        }
    }
    
    
    func persistPin(){
        let alert = UIAlertController(title: "Salvar Crime", message: "Entre com os dados", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default){(action: UIAlertAction) -> Void in
            
            let description = alert.textFields![0] 
            
            _ = alert.textFields![1] 
            
            self.descriptionCrime = description.text
            
            let newAnotation = MKPointAnnotation()
            newAnotation.coordinate = self.newCoord!
            newAnotation.title = self.titleCrime
            newAnotation.subtitle = self.descriptionCrime
            self.mapView.addAnnotation(newAnotation)
            
            self.saveLocationCrime(self.titleCrime, subtitle: self.descriptionCrime, coordinate: self.newCoord!, descriptionCrime: self.descriptionCrime)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){(action: UIAlertAction) -> Void in
            
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "Descrição do Crime"
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "Data do fato"
        }

        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)

    }
    
    

    
    func selectCrime(){
        
        let selectCrimeController = UIAlertController(title: "Seleção de Crime", message: "Clique sobre tipo de crime", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let rouboPessoa = UIAlertAction(title: "Roubo a Pessoa", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Roubo a pessoa"
            self.persistPin() //    Verificar Condicional para nao execu
        })
        
        let furto = UIAlertAction(title: "Furto a Pessoa", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Furto a pessoa"
            self.persistPin()
        })
        
        let trafico = UIAlertAction(title: "Venda de Entorpecente", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Venda de Entorpecente"
            self.persistPin()
        })
        
        let violacao = UIAlertAction(title: "Violação de Direito", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Violação de Direitos"
            self.persistPin()
        })
        
        let rouboVeiculo = UIAlertAction(title: "Roubo de veículo", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Roubo de veículo"
            self.persistPin()
        })
        
        let rouboComercial = UIAlertAction(title: "Roubo em comércio", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Roubo em comércio"
            self.persistPin()
        })
        
        let furtoResiencia = UIAlertAction(title: "Furto em Residencia", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Furto em residência"
            self.persistPin()
        })
        
        let furtoComercio = UIAlertAction(title: "Furto em Comércio", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            self.titleCrime = "Furto em Comércio"
            self.persistPin()
        })
        
        let cancel = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Cancel, handler: {(action: UIAlertAction) -> Void in})
        
        selectCrimeController.addAction(rouboPessoa)
        selectCrimeController.addAction(rouboVeiculo)
        selectCrimeController.addAction(rouboComercial)
        selectCrimeController.addAction(furto)
        selectCrimeController.addAction(furtoResiencia)
        selectCrimeController.addAction(furtoComercio)
        selectCrimeController.addAction(trafico)
        selectCrimeController.addAction(violacao)
        selectCrimeController.addAction(cancel)
        
        presentViewController(selectCrimeController, animated: true, completion: nil)
    }

    
    let regionRadius: CLLocationDirection = 2000
    func centerMapOnLocation(location: CLLocation){
        let cordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(cordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
    }
    
    func saveLocationCrime(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, descriptionCrime: String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let newCrimeLocation = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: managedContext) as! Location
        
        newCrimeLocation.latitude = coordinate.latitude
        newCrimeLocation.longitude = coordinate.longitude
        newCrimeLocation.crime = title
        newCrimeLocation.type = subtitle
        newCrimeLocation.descriptionCrime = descriptionCrime
        var error: NSError?
        
        do {
            try managedContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
    }

    @IBAction func addCrime(sender: AnyObject) {
//        var storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        var vc: TypeCrimeViewController = storyBoard.instantiateViewControllerWithIdentifier("typeCrime") as! TypeCrimeViewController
//        self.presentViewController(vc, animated: true, completion: nil)
        
        self.selectCrime()
    
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Title: \(self.titleCrime)")
        print("SubTitle: \(self.subTitleCrime)")
        loadCrimePins()

    }
    
    func loadCrimePins(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
//        let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: managedContext)
//        
//        var actualCrime = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        let fetchRequest = NSFetchRequest(entityName: "Location")
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "crime != nil")
        let result: NSArray = try! managedContext.executeFetchRequest(fetchRequest)
        
        for obj in result {
            let res = obj as? NSManagedObject
            let lat = res?.valueForKey("latitude") as! Double
            let lon = res?.valueForKey("longitude") as! Double
            let pinCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
            let newPin = Artwork(title: (res?.valueForKey("crime") as? String)!, locationName: (res?.valueForKey("type") as? String)!, coordinate: pinCoordinate as CLLocationCoordinate2D)
            
            artworks.append(newPin)
            
            print(NSDate())
            print("Lat: ", terminator: "")
            print(res?.valueForKey("latitude"))
        }
        
//        for artworkJSON in jsonData {
//            if let artworkJSON = artworkJSON.array,
//                artwork = Artwork.fromJSON(artworkJSON) {
//                    artworks.append(artwork)
//            }
//        }
        
        print(result)
    }
    
    // MARK: SearchBar Functions
    @IBAction func showSearchBar(sender: AnyObject){
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.barTintColor = UIColor(red: 23.0/255.0, green: 111.0/255.0, blue: 178.0/255/0, alpha: 1)
        self.searchController.searchBar.placeholder = "Busca rápida"
        self.searchController.searchBar.prompt = "Digite o endereço..."
        self.searchController.searchBar.tintColor = UIColor.whiteColor()
        presentViewController(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
        if self.mapView.annotations.count != 0 {
            annotation = self.mapView.annotations[0] 
            self.mapView.removeAnnotation(annotation)
        }
        
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        
        localSearch.startWithCompletionHandler { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alert = UIAlertView(title: nil, message: "Place not found", delegate: self, cancelButtonTitle: "Try again")
                alert.show()
                return
            }
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
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
