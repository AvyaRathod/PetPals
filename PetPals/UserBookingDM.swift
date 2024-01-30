//
//  UserBookingDM.swift
//  PetPals
//
//  Created by Avya Rathod on 25/01/24.
//

import Foundation

enum BookingStatus{
    case confirmed, started, compvared, canceled
}

enum PaymentStatus{
    case payOnDelivery, paid
}

struct Booking: Identifiable {
    let id = UUID()
    var serviceProviderID: UUID
    var serviceProviderName: String
    var serviceProviderAddr: String
    var bookingCost: String
    var startDate: Date
    var endDate: Date
    var startTime: Date
    var endTime: Date
    var selectedPets: Set<String>
    var selectedService: String
    var status: BookingStatus
    var paymentStatus: PaymentStatus
}


