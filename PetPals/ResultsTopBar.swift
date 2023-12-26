//
//  ResultsTopBar.swift
//  PetPals
//
//  Created by Avya Rathod on 26/12/23.
//

import SwiftUI

struct CustomTopBar: View {
    var location: String
    var dateRange: String
    var backAction: () -> Void
    var sortAction: () -> Void
    var filterAction: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: -1.0) {
                Color(.appBrown)
                    .frame(height: 57)
                Color(.appYellow)
                    .frame(height: 58)
            }
            
            // Content
            HStack {
                // Back button
                
                
                // Location and date range with background
                VStack(spacing: 4) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.white))
                            .shadow(radius: 3)
                        
                        HStack {
                            Button(action: backAction) {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundColor(Color(.appBrown)) // Dark brown color
                                    .padding(10)
                                    .cornerRadius(10)
                            }
                            
                            Spacer()
                            Text(location)
                                .font(.headline)
                                .foregroundColor(.black)
                            Divider()
                            Text(dateRange)
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                            Spacer()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                    }
                    .frame(height: 50)
                    
                    // Sort and Filter buttons
                    HStack(spacing: 16) {
                        // Sort button
                        Button(action: sortAction) {
                            Label("Sort", systemImage: "arrow.up.arrow.down")
                                .foregroundColor(.white)
                        }
                        // Filter button
                        Button(action: filterAction) {
                            Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                                .foregroundColor(.white)
                        }
                    }.padding(.top, 2.0)
                }
                .offset(y:10)
            }
            .padding()
        }
    }
}

// Preview
struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar(location: "Guduvancheri, India",
                     dateRange: "30 Nov - 1 Dec",
                     backAction: {
                         // Define what the back button should do
                     },
                     sortAction: {
                         // Define what the sort button should do
                     },
                     filterAction: {
                         // Define what the filter button should do
                     })
        .previewLayout(.sizeThatFits)
    }
}
