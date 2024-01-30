import SwiftUI
import MapKit

struct CustomAnnotation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapSelectionView: View {
    @Binding var location: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion
    @State private var annotation: CustomAnnotation
    @State private var isMapExpanded = false

    init(location: Binding<CLLocationCoordinate2D>) {
        self._location = location
        self._region = State(initialValue: MKCoordinateRegion(center: location.wrappedValue, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)))
        self._annotation = State(initialValue: CustomAnnotation(coordinate: location.wrappedValue))
    }

    var body: some View {
        VStack {
            if isMapExpanded {
                fullMapView
            } else {
                compactMapView
            }
        }
    }

    private var fullMapView: some View {
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [annotation]) { annot in
            MapPin(coordinate: annot.coordinate, tint: .red)
        }
        .onTapGesture(coordinateSpace: .local) { location in
            let newCoordinate = region.center
            self.location = newCoordinate
            annotation = CustomAnnotation(coordinate: newCoordinate)
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var compactMapView: some View {
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [annotation]) { annot in
            MapPin(coordinate: annot.coordinate, tint: .red)
        }
        .frame(height: 200)
        .cornerRadius(10)
        .onTapGesture {
            isMapExpanded = true
        }
    }
}

// Usage in SwiftUI View
struct ContentView: View {
    @State private var location = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)

    var body: some View {
        MapSelectionView(location: $location)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
