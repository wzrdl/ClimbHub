import SwiftUI
import MapKit

struct GymDiscoveryView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var searchText = ""
    @State private var selectedGym: ClimbingGym?
    @State private var showingGymDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $locationManager.region,
                    showsUserLocation: true,
                    annotationItems: locationManager.nearbyGyms) { gym in
                    MapAnnotation(coordinate: gym.coordinate) {
                        Image(systemName: "figure.climbing")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                selectedGym = gym
                                showingGymDetail = true
                            }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                
                VStack {
                    SearchBar(text: $searchText)
                        .padding()
                    
                    Spacer()
                    
                    if !locationManager.nearbyGyms.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(locationManager.nearbyGyms) { gym in
                                    GymCard(gym: gym)
                                        .onTapGesture {
                                            selectedGym = gym
                                            showingGymDetail = true
                                        }
                                }
                            }
                            .padding()
                        }
                        .background(Color(.systemBackground).opacity(0.9))
                    }
                }
            }
            .navigationTitle("Nearby Gyms")
            .sheet(isPresented: $showingGymDetail) {
                if let gym = selectedGym {
                    GymDetailView(gym: gym)
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search gyms", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct GymCard: View {
    let gym: ClimbingGym
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(gym.name)
                .font(.headline)
            
            Text(gym.address)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("\(Int(gym.distance))m away")
                .font(.caption)
                .foregroundColor(.blue)
        }
        .padding()
        .frame(width: 200)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    GymDiscoveryView()
} 