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
    @State private var destination = ""
    @State private var selectedOption: SearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("app_yellow")) // Use the color you want for the rounded rectangle
                .frame(height: 240) // Set the height you want for the rounded rectangle
            
            HStack(spacing: 3) {
                ServiceIconView(serviceName: "Boarding", imageName: "boarding-icon")
                ServiceIconView(serviceName: "Daycare", imageName: "daycare-icon")
                ServiceIconView(serviceName: "Sitting", imageName: "sitting-icon")
                ServiceIconView(serviceName: "Walking", imageName: "walking-icon")
            }
            .padding(.top, 120.0)
        }
        .edgesIgnoringSafeArea(.top)
        .offset(y:-80)
        
        //search menu
        VStack{
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text ("Where do you want the service?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale (.small)
                        TextField("Search destinations", text: $destination)
                            .font (.subheadline)
                    }
                    . frame (height: 44)
                    . padding(.horizontal)
                    .overlay {
                        RoundedRectangle (cornerRadius: 8)
                            .stroke (lineWidth: 1.0)
                            . foregroundStyle (Color (.systemGray4))
                    }
                }else{
                    CollapsedPickerView(title: "Where", description: "Add location")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
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
                    
                    SelectYourPetsView()
                    
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
            
            NavigationLink(destination: ResultsView(destination: $destination, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime)){
                Text("Search")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 363)
                    .background(Color.appYellow)
                    .cornerRadius(8)
            }
            .toolbar(.hidden)
        }
        .offset(y:-60)
        
        Spacer()
        
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



#Preview {
    RequestView()
}
