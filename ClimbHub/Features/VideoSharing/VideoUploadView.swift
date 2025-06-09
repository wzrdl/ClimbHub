import SwiftUI
import PhotosUI

struct VideoUploadView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedGrade: BoulderGrade = .v0
    @State private var title = ""
    @State private var description = ""
    @State private var isUploading = false
    @State private var uploadProgress: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    PhotosPicker(selection: $selectedItem,
                               matching: .videos) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "video.badge.plus")
                                    .font(.system(size: 40))
                                Text("Select Video")
                                    .font(.headline)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
                
                Section("Route Information") {
                    TextField("Title", text: $title)
                    
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                    
                    Picker("Grade", selection: $selectedGrade) {
                        ForEach(BoulderGrade.allCases, id: \.self) { grade in
                            Text(grade.rawValue).tag(grade)
                        }
                    }
                }
                
                if isUploading {
                    Section {
                        VStack {
                            ProgressView(value: uploadProgress) {
                                Text("Uploading... \(Int(uploadProgress * 100))%")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Upload Video")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Upload") {
                        uploadVideo()
                    }
                    .disabled(selectedItem == nil || title.isEmpty || isUploading)
                }
            }
        }
    }
    
    private func uploadVideo() {
        isUploading = true
        
        // Simulate upload progress
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if uploadProgress < 1.0 {
                uploadProgress += 0.1
            } else {
                timer.invalidate()
                isUploading = false
                dismiss()
            }
        }
    }
}

#Preview {
    VideoUploadView()
} 