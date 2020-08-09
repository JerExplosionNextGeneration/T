//
//  ViewController.swift
//  VMMVMMV
//
//  Created by Jerry Ren on 8/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var segmentoContro: UISegmentedControl!
    @IBOutlet weak var mMap: MKMapView!
    @IBOutlet weak var teburu: UITableView!
    var viewMModel = ViewMModel.init()
    
    let initLoca = CLLocation(latitude: 52.3740300, longitude: 4.8896900)
    let searcRadi: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mMap.delegate = self
    
//        setUpLocation()
        
        searchSetUp()
        searchInMmap()
    }
    
    func setUpLocation() {
        let loca = CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402)
        let spa = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let regio = MKCoordinateRegion(center: loca, span: spa)
        mMap.setRegion(regio, animated: true)
        
        let annota = MKPointAnnotation()
        annota.coordinate = loca
        annota.title = "Big Ben"
        annota.subtitle = "London"
        mMap.addAnnotation(annota)
    }
    
    @IBAction func segentoAction(_ sender: UISegmentedControl) {
        
        mMap.removeAnnotations(mMap.annotations)
        searchInMmap()
    }
    
    func searchSetUp() {
        let coordRegio = MKCoordinateRegion.init(center: initLoca.coordinate, latitudinalMeters: 2 * searcRadi, longitudinalMeters: 2 * searcRadi)
        mMap.setRegion(coordRegio, animated: true)
    }
    
    func searchInMmap() {
        let reques = MKLocalSearch.Request()
        reques.naturalLanguageQuery = segmentoContro.titleForSegment(at: segmentoContro.selectedSegmentIndex)
        let spa = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        reques.region = MKCoordinateRegion(center: initLoca.coordinate, span: spa)
        
        let searc = MKLocalSearch(request: reques)
        searc.start { (response, erro) in
            for item in response!.mapItems {

                self.addingPinToMmap(title: item.name, lat: (item.placemark.location?.coordinate.latitude)!, longt: (item.placemark.location?.coordinate.longitude)!)
            }
        }
    }
    
    func addingPinToMmap(title: String?, lat: CLLocationDegrees, longt: CLLocationDegrees) {
        if let title = title {
            let loca = CLLocationCoordinate2D(latitude: lat, longitude: longt)
            let annot = MKPointAnnotation()
            annot.coordinate = loca
            annot.title = title
            mMap.addAnnotation(annot)
        }
    }
        

    // MARK: - 
    
    func viewModelTeburuInteractions() {
        
        teburu.dataSource = self
        teburu.delegate = self
        
        viewMModel.getData(urlString: "https://jsonplaceholder.typicode.com/todos/")
        
        DispatchQueue.main.async {
            
            self.viewMModel.closure = { // the closure variable here is actually necessary
                let erro = self.viewMModel.getError()
                if erro.count > 0 {
                    print("erro count > zero")
                } else {
                    self.teburu.reloadData()
                }
            }
        }
    }
    
}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cello = teburu.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
        
        let model = viewMModel.getObject(index: indexPath.row)
        print("model is \(model)")
        
        cello.textLabel?.text = model.title
        
        return cello
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewMModel.getRows()
    }
}



