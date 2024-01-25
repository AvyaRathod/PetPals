//
//  RequestView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

enum SearchOptions{
    case location
    case dates
    case pets
}

struct RequestView: View {
    let results: Results
    
    @State private var selectedOption: SearchOptions = .location
    let services = ["daycare", "dayboarding", "sitting", "walking"]
    let pets = ["Tuffy", "Jerry", "Max", "Buddy"]
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var userBooking: BookingManager

    @State private var selectedPets: Set<String> = []
    @State private var selectedService = ""
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        //search menu
        VStack{
            Spacer()
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text ("What service do you want?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ScrollView {
                        RadioButtonGroup(items: services, selectedId: $selectedService)
                    }
                    . padding(.horizontal)
                    
                }else{
                    CollapsedPickerView(title: "Service", description: "Select a service")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 160 : 64)
            .background (.white)
            .clipShape (RoundedRectangle (cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When do you want the service?")
                        .font (.title2)
                        .fontWeight (.semibold)
                    VStack {
                        HStack {
                            DatePicker ("From", selection: $startDate, displayedComponents:.date)
                            DatePicker ("From-time", selection: $startTime, displayedComponents:.hourAndMinute).labelsHidden()
                        }
                        Divider()
                        HStack{
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                            DatePicker ("From-time", selection: $endTime, displayedComponents:.hourAndMinute).labelsHidden()
                        }
                    }
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 160 : 64)
            .background (.white)
            .clipShape (RoundedRectangle (cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .pets {
                    Text("Which pet?")
                        .font (.title2)
                        .fontWeight (.semibold)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(pets, id: \.self) { petName in
                                SelectPetView(petName: petName, isSelected: selectedPets.contains(petName))
                                    .onTapGesture {
                                        if selectedPets.contains(petName) {
                                            selectedPets.remove(petName)
                                        } else {
                                            selectedPets.insert(petName)
                                        }
                                    }
                                    .padding(.horizontal, 4)
                                    .background(.gray)
                                    .cornerRadius(8)
                            }
                            AddAnimal(petName: "Add Animal", imageName: "p13")
                                .padding(.horizontal, 4)
                                .background(.gray)
                                .cornerRadius(8)
                        }
                    }
                    
                }else{
                    CollapsedPickerView(title: "Pets?", description: "Add Pets")
                }
            }
            .padding()
            .frame(height: selectedOption == .pets ? 270 : 64)
            .background (.white)
            .clipShape (RoundedRectangle (cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .pets }
            }
            
            NavigationLink(destination: ConditionalView(results: Results(img: results.img,
                                                                         name: results.name,
                                                                         stars: results.stars,
                                                                         address: results.address,
                                                                         cost: results.cost),
                                                        startDate: $startDate,
                                                        endDate: $endDate,
                                                        startTime: $startTime,
                                                        endTime: $endTime,
                                                        selectedPets:$selectedPets,
                                                        selectedService:$selectedService).environmentObject(userAuth)
                .environmentObject(userBooking)) {
                Text("Book")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 363)
                    .background(Color.appYellow)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .offset(y:-60)
    }
}

struct ServiceIconView: View {
    var serviceName: String
    var imageName: String

    var body: some View {
        VStack {
            // Service Image Placeholder
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 70, height: 70)
                .foregroundColor(.gray)
            
            Text(serviceName)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(10.0)
        .buttonStyle(PlainButtonStyle())
    }
}

struct CollapsedPickerView: View{
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer ()
                Text (description)
            }
                    .fontWeight(.semibold)
                    .font (.subheadline)
        }
    }
}

struct ConditionalView: View {
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var userBooking: BookingManager
    
    let results: Results
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    
    var body: some View {
        Group {
            if userAuth.isLoggedIn {
                CheckoutView(results: results,
                             startDate: $startDate,
                             endDate: $endDate,
                             startTime: $startTime,
                             endTime: $endTime,
                             selectedPets:$selectedPets,
                             selectedService:$selectedService).environmentObject(userBooking)
            } else {
                LoginView(results: results,
                          startDate: $startDate,
                          endDate: $endDate,
                          startTime: $startTime,
                          endTime: $endTime,
                          selectedPets:$selectedPets,
                          selectedService:$selectedService)
            }
        }
    }
}

struct RequestView_Previews: PreviewProvider {
    
    static var previews: some View {
        RequestView(results: Results(img: "petimage-1",
                                     name: "Rimi Lan",
                                     stars: 5,
                                     address: "123 anywhere st. any city state country 123",
                                     cost: "150"))
        .environmentObject(UserAuth())
    }
}
