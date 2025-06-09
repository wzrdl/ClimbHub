import SwiftUI

struct VideoLibraryView: View {
    @State private var selectedGrade: BoulderGrade?
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Grade filter
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
                .padding(.vertical, 8)
                
                // Video grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 15) {
                        ForEach(0..<10) { _ in
                            RouteVideoCard()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Route Videos")
            .searchable(text: $searchText, prompt: "Search videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // TODO: Show video upload sheet
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    VideoLibraryView()
} 