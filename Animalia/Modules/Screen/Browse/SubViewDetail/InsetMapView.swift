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
    
    @State private var cameraPosition =
    MapCameraPosition.region(MKCoordinateRegion(
    center:CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422),
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    
        )
    )
    
    @State private var cameraPosition2: MapCameraPosition = {
            let centerCoordinate = CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422)
            
            let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    //https://forms.gle/k2eGqEECzLQ15Z7v8
            let region = MKCoordinateRegion(center: centerCoordinate, span: coordinateSpan)
            
            return MapCameraPosition.region(region)
        }()
    
    
    
    var body: some View {
        ZStack (alignment:.topTrailing){
            Map(position: $cameraPosition)
                .frame(height: 250)
            HStack {
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                Text("Locations")
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
            }
            .padding(.vertical,10)
            .padding(.horizontal,14)
            .background(
                Color.black
                    .opacity(0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            )
            .padding(12)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
        
//        Map {
//            Marker("Borneo",coordinate: .borneo)
//        }
    }
}

#Preview {
    InsetMapView()
}
