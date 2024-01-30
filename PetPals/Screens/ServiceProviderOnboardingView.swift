import SwiftUI
import MapKit




struct OnboardingQuestionnaireView: View {
    @State private var pal = Pal(
        name: "",
        profileImage: "",
        rating: 0,
        address: "",
        summary: "",
        servicesOffered: [],
        acceptedPets: [],
        neighborhoodLocation: CLLocationCoordinate2D(),
        reviews: [],
        contactInfo: ContactInformation(phoneNumber: "", instagramHandle: nil, whatsappNumber: nil),
        isFavourite: false
    )
    
    let allPets = ["Dog", "Cat", "Rabbit", "Bird", "Hamster", "Guinea Pig", "Fish", "Turtle", "Lizard", "Snake"]
    @State private var searchText = ""
    @State private var selectedPets: [String] = []
    
    private var filteredPets: [String] {
        searchText.isEmpty ? allPets : allPets.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var selectedLocation = CLLocationCoordinate2D()
    @State private var images: [UIImage] = []
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        // Here you can handle the loaded image
    }
    
    // Function to convert UIImage to Base64 String
    func convertImageToBase64String(img: UIImage) {
        guard let imageData = img.jpegData(compressionQuality: 0.5) else { return }
        let base64String = imageData.base64EncodedString()
        pal.profileImage = base64String
    }
    
    @State private var isPreviewShown = false

    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Details")) {
                    Button("Select Profile Image") {
                        showingImagePicker = true
                    }
                    
                    if let inputImage = inputImage {
                        Image(uiImage: inputImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                            .onAppear {
                                convertImageToBase64String(img: inputImage)
                            }
                    }
                    TextField("Name", text: $pal.name)
                    TextField("Contact Number", text: $pal.contactInfo.phoneNumber)
                    // Add additional personal detail fields here
                }
                
                Section(header: Text("Extra Contact Information")) {
                    // Custom binding for WhatsApp Number
                    let whatsappBinding = Binding<String>(
                        get: { pal.contactInfo.whatsappNumber ?? "" },
                        set: { pal.contactInfo.whatsappNumber = $0.isEmpty ? nil : $0 }
                    )
                    TextField("WhatsApp Number", text: whatsappBinding)
                    
                    // Custom binding for Instagram Handle
                    let instagramBinding = Binding<String>(
                        get: { pal.contactInfo.instagramHandle ?? "" },
                        set: { pal.contactInfo.instagramHandle = $0.isEmpty ? nil : $0 }
                    )
                    TextField("Instagram Handle", text: instagramBinding)
                }
                
                Section(header: Text("Services Offered")) {
                    ForEach($pal.servicesOffered.indices, id: \.self) { index in
                        Picker("Service", selection: $pal.servicesOffered[index].name) {
                            ForEach(serviceName.allCases, id: \.self) { service in
                                Text(service.rawValue).tag(service)
                            }
                        }
                        TextField("Description", text: $pal.servicesOffered[index].description)
                        TextField("Price", text: $pal.servicesOffered[index].price)
                    }
                    Button("Add Service") {
                        pal.servicesOffered.append(ServicesOffered(name: .daycare, description: "", price: ""))
                    }
                }
                
                Section(header: Text("Tell us about yourself and your business")) {
                    TextField("Summary", text: $pal.summary)
                }
                
                Section(header: Text("Accepted Pets")) {
                    TextField("Search Pets", text: $searchText)
                    
                    ForEach(filteredPets, id: \.self) { pet in
                        PetCheckboxView(petName: pet, isSelected: .init(get: {
                            selectedPets.contains(pet)
                        }, set: { isSelected in
                            if isSelected {
                                selectedPets.append(pet)
                            } else {
                                selectedPets.removeAll { $0 == pet }
                            }
                        }))
                    }
                }
                
                Section(header: Text("Location")) {
                    MapSelectionView(location: $selectedLocation)
                        .frame(height: 200)
                }
                Button("Submit") {
                    isPreviewShown = true                }
            }
            .navigationBarTitle("Service Provider Onboarding", displayMode: .inline)
            .sheet(isPresented: $isPreviewShown) {
                ServiceProviderPreviewView(pal: pal)
            }
        }
    }
}

struct PetCheckboxView: View {
    var petName: String
    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            Text(petName)
            Spacer()
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundColor(isSelected ? .blue : .gray)
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct ServiceProviderPreviewView: View {
    var pal: Pal
    var onEdit: (() -> Void)?
    var onSubmit: (() -> Void)?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Review Your Information")
                        .font(.title)
                        .padding()

                    Group {
                        Text("Name: \(pal.name)")
                        Text("Contact Number: \(pal.contactInfo.phoneNumber)")
                        if let whatsappNumber = pal.contactInfo.whatsappNumber {
                            Text("WhatsApp Number: \(whatsappNumber)")
                        }
                        if let instagramHandle = pal.contactInfo.instagramHandle {
                            Text("Instagram Handle: \(instagramHandle)")
                        }
                        Text("Summary: \(pal.summary)")

                        // Display services
                        ForEach(pal.servicesOffered, id: \.name) { service in
                            VStack(alignment: .leading) {
                                Text("Service: \(service.name.rawValue)")
                                Text("Description: \(service.description)")
                                Text("Price: \(service.price)")
                            }
                        }

                        // Display accepted pets
                        Text("Accepted Pets: \(pal.acceptedPets.joined(separator: ", "))")
                    }
                    .padding()

                    // Display location if available
                    if CLLocationCoordinate2DIsValid(pal.neighborhoodLocation) {
                        Text("Location: Latitude \(pal.neighborhoodLocation.latitude), Longitude \(pal.neighborhoodLocation.longitude)")
                    }

                    // Display profile image if available
                    if let image = UIImage(data: Data(base64Encoded: pal.profileImage) ?? Data()) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                }
            }
            .navigationBarTitle("Preview", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Edit") {
                    onEdit?()
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Submit") {
                    // Implement the data submission logic here
                    onSubmit?()
                    // Close the modal view and redirect to home view
                    presentationMode.wrappedValue.dismiss()
                    // Implement redirection to home view
                }
            )
        }
    }
}

struct ServiceProviderPreviewView_Previews: PreviewProvider {
    @State static var samplePal = Pal(
        name: "Alice Johnson",
        profileImage: "", // Base64 encoded image string
        rating: 4,
        address: "123 anywhere st. any city state country 123",
        summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
        servicesOffered: [
            ServicesOffered(name: .dayboarding, description: "Safe and caring overnight stay", price: "INR 200/Night"),
            ServicesOffered(name: .daycare, description: "Fun-filled daytime care", price: "INR 150/Day")
        ],
        acceptedPets: ["Cats", "Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
        reviews: [],
        contactInfo: ContactInformation(phoneNumber: "1234567890", instagramHandle: "@alicepets", whatsappNumber: "9876543210"),
        isFavourite: false
    )

    static var previews: some View {
        ServiceProviderPreviewView(pal: samplePal)
    }
}


    struct OnboardingQuestionnaireView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingQuestionnaireView()
        }
    }

    // ImagePicker View
    struct ImagePicker: UIViewControllerRepresentable {
        @Environment(\.presentationMode) var presentationMode
        @Binding var image: UIImage?

        func makeUIViewController(context: Context) -> some UIViewController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker

            init(_ parent: ImagePicker) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = uiImage
                }

                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
