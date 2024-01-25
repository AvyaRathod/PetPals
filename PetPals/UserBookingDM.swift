//
//  UserBookingDM.swift
//  PetPals
//
//  Created by Avya Rathod on 25/01/24.
//

import Foundation

enum BookingStatus{
    case confirmed, started, completed, canceled
}

enum PaymentStatus{
    case payOnDelivery, paid
}

struct Booking: Identifiable {
    
   
    
    let id = UUID()
    let serviceProviderID: UUID
    let serviceProviderName: String
    let serviceProviderAddr: String
    let bookingCost: String
    let startDate: Date
    let endDate: Date
    let startTime: Date
    let endTime: Date
    let selectedPets: Set<String>
    let selectedService: String
    let status: BookingStatus
    let paymentStatus: PaymentStatus
}


