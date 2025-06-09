import Foundation
import CoreLocation

struct ClimbingGym: Identifiable {
    let id: String
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    let phoneNumber: String?
    let website: String?
    let description: String
    var distance: CLLocationDistance
    
    // For preview and testing
    static let sampleGyms = [
        ClimbingGym(
            id: "1",
            name: "Vertical World",
            address: "123 Climbing St, Seattle, WA",
            coordinate: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321),
            phoneNumber: "(206) 555-0123",
            website: "https://verticalworld.com",
            description: "Premier climbing gym in Seattle",
            distance: 500
        ),
        ClimbingGym(
            id: "2",
            name: "Stone Gardens",
            address: "456 Boulder Ave, Seattle, WA",
            coordinate: CLLocationCoordinate2D(latitude: 47.6162, longitude: -122.3421),
            phoneNumber: "(206) 555-0456",
            website: "https://stonegardens.com",
            description: "Bouldering-focused climbing gym",
            distance: 800
        )
    ]
} 