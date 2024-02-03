//
//  CurrentBookingsView.swift
//  PetPals
//
//  Created by Avya Rathod on 30/01/24.
//

import SwiftUI

struct CurrentBookingsView: View {
    @EnvironmentObject var userBooking: BookingManager

    var body: some View {
        ScrollView{
            VStack{
                ForEach(userBooking.bookings){ booking in
                        
                }
            }
        }
    }
}

struct UserBookingPlaccard: View{
    var booking:Booking
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Confirmed")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            
            HStack{
                
                VStack(alignment: .leading) {
                    Text(booking.startDate.formatted(Date.FormatStyle().weekday(.abbreviated)))
                        .fontWeight(.bold)
                    Text(booking.startDate, style: .date)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(booking.selectedService)
                        .fontWeight(.bold)
                    Text(booking.startTime, style: .time)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("For \(booking.selectedPets.count)")
                        .fontWeight(.bold)
                    Text("Pets")
                        .foregroundColor(.secondary)
                }
            }.padding(.leading)
            
            
            HStack {
                VStack(alignment: .leading){
                    Text(booking.palBooked.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    Text(booking.palBooked.address)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    // Action for venue location
                }) {
                    Image(systemName: "map")
                        .foregroundColor(.white)
                        .frame(width:15,height: 15)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                
            }
            .padding(.leading)
            
            NavigationLink(destination: BookingConfirmationView(Bookinginfo: booking)){
                Text("View Details")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 15)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding([.trailing,.leading])
            
        }
        .padding()
        .frame(width:360)
        .background (.white)
        .clipShape (RoundedRectangle (cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
    }
}


#Preview {
    CurrentBookingsView()
        .environmentObject(BookingManager())

}
