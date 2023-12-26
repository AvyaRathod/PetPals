//
//  ResultsView.swift
//  PetPals
//
//  Created by Avya Rathod on 26/12/23.
//

import SwiftUI

struct ResultsView: View {
    @Binding var destination: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
        
    var body: some View {
        NavigationView {
            VStack {
                CustomTopBar(
                    location: destination,
                    dateRange: dateRangeString(from: startDate, to: endDate),
                    backAction: {
                        // Define what the back button should do
                    },
                    sortAction: {
                        // Define what the sort button should do
                    },
                    filterAction: {
                        // Define what the filter button should do
                    }
                )
                
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(0..<10) { index in // Replace with actual data source
                            BookingPlacard(results: Results(img: "petimage-1",
                                                            name: "Rimi Lan",
                                                            stars: 5,
                                                            address: "123 anywhere st. any city state country 123",
                                                            cost: "150"))
                        }
                    }
                }
            }
        }
        .toolbar(.hidden)
    }
}

private func dateRangeString(from startDate: Date, to endDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMM" // e.g., 30 Nov
    
    let startDateString = dateFormatter.string(from: startDate)
    let endDateString = dateFormatter.string(from: endDate)
    
    return "\(startDateString) - \(endDateString)"
    
}



struct ResultsView_Previews: PreviewProvider {
    // These are mock bindings for the purpose of the preview.
    // In your actual view, these would be real @State or @Binding properties.
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()

    static var previews: some View {
        ResultsView(destination: $mockDestination, startDate: $mockStartDate, endDate: $mockEndDate, startTime: $mockStartDate, endTime: $mockEndDate)
            .previewLayout(.sizeThatFits) // You can change this to fit your preview needs
    }
}
