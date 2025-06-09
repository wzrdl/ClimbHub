import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isEditing = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var profileImage: Image?
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            if let profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                            }
                            
                            if isEditing {
                                PhotosPicker(selection: $selectedItem,
                                           matching: .images) {
                                    Text("Change Photo")
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
                
                Section("Personal Information") {
                    if isEditing {
                        TextField("Nickname", text: .constant(authViewModel.currentUser?.nickname ?? ""))
                        
                        HStack {
                            Text("Height")
                            Spacer()
                            TextField("cm", value: .constant(authViewModel.currentUser?.height ?? 0), format: .number)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("Arm Span")
                            Spacer()
                            TextField("cm", value: .constant(authViewModel.currentUser?.armSpan ?? 0), format: .number)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("Weight")
                            Spacer()
                            TextField("kg", value: .constant(authViewModel.currentUser?.weight ?? 0), format: .number)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                    } else {
                        LabeledContent("Nickname", value: authViewModel.currentUser?.nickname ?? "")
                        LabeledContent("Height", value: "\(authViewModel.currentUser?.height ?? 0) cm")
                        LabeledContent("Arm Span", value: "\(authViewModel.currentUser?.armSpan ?? 0) cm")
                        LabeledContent("Weight", value: "\(authViewModel.currentUser?.weight ?? 0) kg")
                    }
                }
                
                Section("Climbing Grades") {
                    if isEditing {
                        Picker("Boulder Grade", selection: .constant(authViewModel.currentUser?.boulderGrade ?? .v0)) {
                            ForEach(BoulderGrade.allCases, id: \.self) { grade in
                                Text(grade.rawValue).tag(grade)
                            }
                        }
                        
                        Picker("Sport Grade", selection: .constant(authViewModel.currentUser?.sportGrade ?? .fiveNine)) {
                            ForEach(SportGrade.allCases, id: \.self) { grade in
                                Text(grade.rawValue).tag(grade)
                            }
                        }
                    } else {
                        LabeledContent("Boulder Grade", value: authViewModel.currentUser?.boulderGrade.rawValue ?? "")
                        LabeledContent("Sport Grade", value: authViewModel.currentUser?.sportGrade.rawValue ?? "")
                    }
                }
                
                Section {
                    Button(role: .destructive) {
                        authViewModel.signOut()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sign Out")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Done" : "Edit") {
                        isEditing.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
} 