//
//  ScreenFiveViewController.swift
//  testiOS
//
//  Created by andyptra on 5/2/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit
import MapKit

class ScreenFiveViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedAnnotation : String?
    var allData = DataList.datas
    var message : String?
    var indexSet : Int?
    private var selectedOffersIndex: Int = -1
    let initialLocation = CLLocation(latitude: -7.5189638, longitude: 110.5863656)
    var userPinView: MKAnnotationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mapView.delegate = self
        
        mapView.centerToLocation(initialLocation)
        
        for location in allData {
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude:location.Lat, longitude: location.Long)
            mapView.addAnnotation(annotation)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: indexSet ?? 0, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    func setMap(title: String, Lat: Double, Long : Double )->MKAnnotation{
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = CLLocationCoordinate2D(latitude: Lat, longitude: Long)
        return annotation
        
    }
    
    func setupNavigationBar(){
        self.title = "EVENTS";
        self.setDefaultToolbar(dismissTabBar: #selector(dismissTabBar))
        
    }
    
    @objc private func dismissTabBar () {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ScreenFiveViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "ic_marker_unselected.png")
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_marker_selected.png")
        guard view.annotation != nil else {
            return
        }
        for (index, item) in allData.enumerated() {
            if let title = view.annotation?.title {
                if item.title == title! {
                    self.indexSet = index-1
                    break
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_marker_unselected.png")
    }
    
}

extension ScreenFiveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupUI(){
        setupNavigationBar()
        showIconBar(imageOne: "ic_list_view.png", imageTwo: "ic_search_white.png")
        self.collectionView.register(ListArticleCollectionViewCell.nib(), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ListArticleCollectionViewCell
        let data = allData[indexPath.row]
        cell.titleLbl.text =  data.title
        cell.subTitle.text = data.subTitle
        cell.dateTitle.text = data.Date
        return cell
    }
    
}

extension ScreenFiveViewController :  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


