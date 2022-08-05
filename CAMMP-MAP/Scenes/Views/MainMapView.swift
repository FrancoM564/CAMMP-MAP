
import SwiftUI
import GoogleMaps

struct location{
    let name : String
    let latitude : Double
    let longitude : Double
}

struct MainMapView: UIViewRepresentable{
    
   
    
    @ObservedObject var locationManager = LocationManager()
    @EnvironmentObject private var dataFetchManager : DataFetchManager
    @Binding var markerNow : GMSMarker?
    @Binding var markerTapped : Bool

    
    var locations = [location(name: "Aeropuerto Jorge Chavez", latitude: -12.023822941249792, longitude: -77.11201964535306)]
    let zoom: Float = 12.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        
        //Implementar que cargue con ubicacion del usuario
        let target = CLLocationCoordinate2D(latitude: -12.08, longitude: -76.97)
        //let target2 = CLLocationCoordinate2D(latitude:-12.0, longitude: -77.0)
        
        let camera = GMSCameraPosition.camera(withTarget: target, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        makeMarkers(mapView, locations)
        
        do {
              if let styleURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
              } else {
                NSLog("Unable to find style.json")
              }
            } catch {
              NSLog("One or more of the map styles failed to load. \(error)")
            }
        
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()
        makeMarkers(mapView, locations)
    }
    
    
    class Coordinator: NSObject, GMSMapViewDelegate{
        let owner: MainMapView
        
        init(_ mapView: MainMapView){
            owner = mapView
        }
        
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            owner.markerNow = marker
            print(marker.position.longitude)
            print(marker.position.latitude)
            owner.markerTapped = true
            return true
        }
    }
    
    
    
}

func makeMarkers(_ mapView : GMSMapView,_ locations: [location]){
    guard !locations.isEmpty else {
        print("No locations to mark")
        return
    }
    
    for location in locations {
        let place = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let marker = GMSMarker(position: place)
        marker.icon = GMSMarker.markerImage(with: .orange)
        marker.snippet = location.name
        marker.map = mapView
    }
}

