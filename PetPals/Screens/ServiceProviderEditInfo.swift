//
//  ServiceProviderEditInfo.swift
//  PetPals
//
//  Created by Avya Rathod on 30/01/24.
//

import SwiftUI
import MapKit

struct ServiceProviderEditInfo: View {
    
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
    
    @Environment(\.presentationMode) var presentationMode

    
    // Function to convert UIImage to Base64 String
    func convertImageToBase64String(img: UIImage) {
        guard let imageData = img.jpegData(compressionQuality: 0.5) else { return }
        let base64String = imageData.base64EncodedString()
        pal.profileImage = base64String
    }
    
    @State private var isPreviewShown = false

    
    var body: some View {
        NavigationView {
            
            ScrollView{
                VStack{
                    VStack{
                        if let inputImage = inputImage {
                            Image(uiImage: inputImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding()
                                .onAppear {
                                    convertImageToBase64String(img: inputImage)
                                    showingImagePicker=false
                                }
                                .onTapGesture(perform: {
                                    showingImagePicker = true
                                })
                        } else {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                .onTapGesture(perform: {
                                    showingImagePicker = true
                                })
                            
                        }}
                    
                    VStack{
                        TextField("Name", text: $pal.name)
                        Divider()
                        TextField("Contact Number", text: $pal.contactInfo.phoneNumber)
                    }
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360)
                    .shadow(radius: 5)
                    
                    VStack{
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
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360)
                    .shadow(radius: 5)
                    
                    VStack{
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
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360)
                    .shadow(radius: 5)
                    
                    VStack{
                        TextField("Summary", text: $pal.summary)
                    }
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360,height: 100)
                    .shadow(radius: 5)
                    
                    VStack{
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
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360)
                    .shadow(radius: 5)
                    
                    VStack{
                        TextField("Address", text: $pal.address)
                        MapSelectionView(location: $selectedLocation)
                            .frame(height: 200)
                        
                    }
                    .padding()
                    .background(Color(UIColor.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 360)
                    .shadow(radius: 5)
                    
                    
                    Button("Submit") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            
        }
        .navigationBarTitle("Service Provider Onboarding", displayMode: .inline)
    }
}


#Preview {
    ServiceProviderEditInfo()
}
