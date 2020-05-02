//
//  EventModel.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation
import MapKit
struct DataList {
    let title: String
    let subTitle: String
    let Date: String
    let Long : Double
    let Lat :  Double
    
    static let datas = [
        DataList(title: "GOR Poncobudoyo", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2019", Long: 110.5863656, Lat: -7.5189638),
        DataList(title: "Spbu Pertamina", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2019", Long: 110.5894118, Lat: -7.5200111),
        DataList(title: "Warung Makan", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2019", Long: 110.5882583, Lat: -7.5196135),
        DataList(title: "SMP Boyolali", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2019", Long: 110.5904427, Lat: -7.5199241),
        
    ]
}



//class Artwork: NSObject, MKAnnotation {
//  let title: String?
//  let subTitle : String?
//  let locationName: String?
//  let discipline: String?
//  let coordinate: CLLocationCoordinate2D
//
//  init(
//    title: String?,
//    subTitle : String?,
//    locationName: String?,
//    discipline: String?,
//    coordinate: CLLocationCoordinate2D
//  ) {
//    self.title = title
//    self.subTitle = subTitle
//    self.locationName = locationName
//    self.discipline = discipline
//    self.coordinate = coordinate
//
//    super.init()
//  }
//
//  var subtitle: String? {
//    return locationName
//  }
//
//}
