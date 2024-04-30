//
//  MapAnnotationView.swift
//  Animalia
//
//  Created by User50 on 30/04/24.
//

import SwiftUI
import MapKit


struct MapAnnotationView: View {
    @State private var animation: Double = 0.0
    var location: LocationModel
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accent)
                .frame(width: 60, height: 60)
            
            Circle()
                .stroke(Color.accent)
                .frame(width: 60, height: 60)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
                
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    var locations: [LocationModel] = Bundle.main.decode("locations.json")
    return MapAnnotationView(location: locations[1])
}
