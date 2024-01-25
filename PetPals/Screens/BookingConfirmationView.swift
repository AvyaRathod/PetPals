//
//  BookingonfirmationView.swift
//  PetPals
//
//  Created by Avya Rathod on 20/01/24.
//

import SwiftUI

struct BookingConfirmationView: View {

    let results: Results
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    
    init(results: Results, startDate: Date, endDate: Date, startTime: Date, endTime: Date, selectedPets: Set<String>, selectedService: String) {
            self.results = results
            self._startDate = Binding.constant(startDate)
            self._endDate = Binding.constant(endDate)
            self._startTime = Binding.constant(startTime)
            self._endTime = Binding.constant(endTime)
            self._selectedPets = Binding.constant(selectedPets)
            self._selectedService = Binding.constant(selectedService)
        }

        // Initializing with bindings
    init(results: Results, startDate: Binding<Date>, endDate: Binding<Date>, startTime: Binding<Date>, endTime: Binding<Date>, selectedPets: Binding<Set<String>>, selectedService: Binding<String>) {
        self.results = results
        self._startDate = startDate
        self._endDate = endDate
        self._startTime = startTime
        self._endTime = endTime
        self._selectedPets = selectedPets
        self._selectedService = selectedService
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.green)
                    .padding(.top, 20)
                    .shadow(color:Color.green,radius: 50)
                
                Text("Your Booking is confirmed!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Confirmed")
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text(results.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            
                            Text(results.address)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Action for venue location
                        }) {
                            Image(systemName: "map")
                                .foregroundColor(.white)
                                .frame(width:22,height: 22)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(12)
                        }
                        
                    }
                    .padding()
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("From")
                            Text(startDate, style: .date)
                                .fontWeight(.bold)
                            Text(startTime, style: .time)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Divider()
                            .frame(height: 50.0)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("To")
                            Text(endDate, style: .date)
                                .fontWeight(.bold)
                            Text(endTime, style: .time)
                                .fontWeight(.bold)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    Divider()
                    
                    HStack {
                        Text("Pets")
                        Spacer()
                        Text(selectedPets.joined(separator: ", "))
                            .fontWeight(.bold)
                    }
                    .padding([.leading, .trailing, .top])
                    
                }
                .padding()
                .frame(width:360)
                .background (.white)
                .clipShape (RoundedRectangle (cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                
                Button(action: {
                        // Action to call the venue
                    }) {
                        Text("Call outlet")
                            .foregroundColor(.white)
                            .frame(width: 250, height: 22)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                
                // Next Steps Section
                VStack(alignment: .leading) {
                    Text("What to do next?")
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    
                    Text("Reach at the Pal's on the booked date and time")
                    Text("Don’t forget to pay your bill via the PetPals app for added safety")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.top, 20)
                
                
                NavigationLink(destination:HomeView()){
                    Text("Done")
                }
                .foregroundColor(.white)
                .frame(width:100)
                .padding()
                .background(Color.red)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 20)
                

            }
            .background(Color.white)
        }
        .toolbar(.hidden)
    }
}



struct BookingConfirmationView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    @State static var selectedService = "walking"
    @State static var selectedPets:Set<String> = ["Tuffy", "Jerry", "Max", "Buddy"]
    
    static var previews: some View {
        NavigationView {
            BookingConfirmationView(results: Results(img: "petimage-1",
                                          name: "Rimi Lan",
                                          stars: 5,
                                          address: "123 anywhere st. any city state country 123",
                                          cost: "150"),
                         startDate: $mockStartDate, endDate: $mockEndDate, startTime: $mockStartDate, endTime: $mockEndDate,
                         selectedPets:$selectedPets,
                         selectedService:$selectedService)
        }
    }
}
