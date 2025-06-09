import SwiftUI
import MapKit

struct GymDetailView: View {
    let gym: ClimbingGym
    @Environment(\.dismiss) private var dismiss
    @State private var selectedGrade: BoulderGrade?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Map preview
                    Map(coordinateRegion: .constant(MKCoordinateRegion(
                        center: gym.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )))
                    .frame(height: 200)
                    .cornerRadius(10)
                    
                    // Gym info
                    VStack(alignment: .leading, spacing: 10) {
                        Text(gym.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(gym.address)
                            .foregroundColor(.gray)
                        
                        if let phone = gym.phoneNumber {
                            Button(action: {
                                guard let url = URL(string: "tel:\(phone)") else { return }
                                UIApplication.shared.open(url)
                            }) {
                                Label(phone, systemImage: "phone")
                            }
                        }
                        
                        if let website = gym.website {
                            Link(destination: URL(string: website)!) {
                                Label("Visit Website", systemImage: "globe")
                            }
                        }
                        
                        Text(gym.description)
                            .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    // Route videos section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Route Videos")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(BoulderGrade.allCases, id: \.self) { grade in
                                    GradeFilterButton(
                                        grade: grade,
                                        isSelected: selectedGrade == grade,
                                        action: {
                                            selectedGrade = grade
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Video grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 15) {
                            ForEach(0..<4) { _ in
                                RouteVideoCard()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Open in Maps app
                        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: gym.coordinate))
                        mapItem.name = gym.name
                        mapItem.openInMaps()
                    }) {
                        Image(systemName: "map")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct GradeFilterButton: View {
    let grade: BoulderGrade
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(grade.rawValue)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(8)
        }
    }
}

struct RouteVideoCard: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(16/9, contentMode: .fit)
                .overlay(
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading) {
                Text("V4 Route")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text("by Climber123")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    GymDetailView(gym: ClimbingGym.sampleGyms[0])
} 