//
//  UserBookingDM.swift
//  PetPals
//
//  Created by Avya Rathod on 25/01/24.
//

import Foundation
import MapKit

enum BookingStatus{
    case confirmed, started, completed, canceled
}

enum PaymentStatus{
    case payOnDelivery, paid
}

struct Booking: Identifiable {
    let id = UUID()
    var palBooked: Pal
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

