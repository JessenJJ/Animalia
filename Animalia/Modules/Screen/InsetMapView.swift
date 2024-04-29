//
//  InsetMapView.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
//    latitude 4.177242606720618, longitude 113.99426783068355
    

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 4.1772, longitude: 113.994),span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

#Preview {
    InsetMapView()
}
