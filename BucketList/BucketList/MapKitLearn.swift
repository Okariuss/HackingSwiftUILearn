//
//  MapKitLearn.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI
import MapKit

struct MapKitLearn: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
//        Map()
//            .mapStyle(.hybrid(elevation: .realistic))
//        Map(interactionModes: [.rotate, .zoom])
//        Map(interactionModes: [])
        Map(position: $position)
            .onMapCameraChange(frequency: .onEnd) { context in
                print(context.region)
            }
        HStack(spacing: 50) {
            Button("Paris") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }

            Button("Tokyo") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
        }
    }
}

struct LocationMapKitLearn: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct AnnotationMapKitLearn: View {
    let locations = [
        LocationMapKitLearn(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        LocationMapKitLearn(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map {
            ForEach(locations) { location in
//                Marker(location.name, coordinate: location.coordinate)
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .annotationTitles(.hidden)
            }
        }
        
        MapReader { proxy in
            Map()
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
        }
        
        
    }
}

#Preview {
    AnnotationMapKitLearn()
}
