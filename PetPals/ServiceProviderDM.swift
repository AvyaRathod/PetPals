//
//  ServiceProviderDM.swift
//  PetPals
//
//  Created by Avya Rathod on 27/01/24.
//

import Foundation
import MapKit
import SwiftUI

struct Pal:Identifiable {
    let id = UUID()
    var name: String
    var profileImage: String?
    var rating: Int
    var address: String
    var summary: String
    var servicesOffered: [ServicesOffered]
    var acceptedPets: [String]
    var neighborhoodLocation: CLLocationCoordinate2D
    var reviews: [Review]
    var contactInfo: ContactInformation
    var isFavourite: Bool? = false
    
    func minCost(pal: Pal) -> String {
        let prices = pal.servicesOffered.compactMap { service -> Int? in
            let priceString = service.price.filter { "0"..."9" ~= $0 }
            return Int(priceString)
        }
        
        guard let minPrice = prices.min() else {
            return "N/A" // Return this if no prices are available
        }

        return "INR \(minPrice)"
    }

}

enum serviceName: String, CaseIterable {
    case daycare = "Daycare"
    case dayboarding = "Dayboarding"
    case sitting = "Sitting"
    case walking = "Walking"
}


struct ServicesOffered {
    var name: serviceName
    var description: String
    var price: String
}

struct Review:Identifiable {
    let id = UUID()
    var review: String
    var rating: Int
    var username: String
    var profileImage: String
}

struct ContactInformation {
    var phoneNumber: String
    var instagramHandle: String?
    var whatsappNumber: String?
}

let palsArray: [Pal] = [
    Pal(
        name: "Alice Johnson",
        profileImage: "petimage-1",
        rating: 4,
        address: "123 anywhere st. any city state country 123",
        summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
        servicesOffered: [
            ServicesOffered(name: .dayboarding, description: "Safe and caring overnight stay", price: "INR 200/Night"),
            ServicesOffered(name: .daycare, description: "Fun-filled daytime care", price: "INR 150/Day")
        ],
        acceptedPets: ["Cats", "Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
        reviews: [
            Review(review: "Alice was wonderful with my Max!", rating: 5, username: "John Doe", profileImage: "profilepic-1"),
            Review(review: "Very caring and attentive.", rating: 4, username: "Emma Stone", profileImage: "profilepic-2"),
            Review(review: "Best pet sitter in town!", rating: 5, username: "Mike Ross", profileImage: "profilepic-3"),
            Review(review: "Highly recommend Alice for pet sitting.", rating: 4, username: "Sarah Connor", profileImage: "profilepic-4")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "1234567890",
            instagramHandle: "@alicepets",
            whatsappNumber: "9876543210"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Bob Smith",
        profileImage: "petimage-1",
        rating: 5,
        address: "123 anywhere st. any city state country 123",
        summary: "Experienced dog walker and sitter with a love for all animals.",
        servicesOffered: [
            ServicesOffered(name: .walking, description: "Daily walking services", price: "INR 100/Walk"),
            ServicesOffered(name: .sitting, description: "Attentive and caring sitting", price: "INR 120/Day")
        ],
        acceptedPets: ["Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9721, longitude: 77.5937),
        reviews: [
            Review(review: "Bob was great with my dog!", rating: 5, username: "Laura Palmer", profileImage: "profilepic-2"),
            Review(review: "Trustworthy and reliable.", rating: 5, username: "James Hurley", profileImage: "profilepic-3"),
            Review(review: "My dog loves him!", rating: 5, username: "Donna Hayward", profileImage: "profilepic-4"),
            Review(review: "Will book again.", rating: 5, username: "Norma Jennings", profileImage: "profilepic-1")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "9876543210",
            instagramHandle: "@bobthedogwalker",
            whatsappNumber: "1234567890"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Alex Johnson",
        profileImage: "petimage-1",
        rating: 5,
        address: "123 anywhere st. any city state country 123",
        summary: "I'm a professional pet sitter with over 5 years of experience. I love taking care of pets and ensure they feel right at home.",
        servicesOffered: [
            ServicesOffered(name: .dayboarding, description: "Overnight pet care at my spacious home", price: "INR 200/Night"),
            ServicesOffered(name: .walking, description: "Daily walks in the park for your pet", price: "INR 50/Walk")
        ],
        acceptedPets: ["Cats", "Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
        reviews: [
            Review(review: "Alex was wonderful with my Golden Retriever. Highly recommend!", rating: 5, username: "Sarah", profileImage: "sarah-profile"),
            Review(review: "Great experience, my cat loved the stay!", rating: 4, username: "Mike", profileImage: "mike-profile")
        ],
        contactInfo: ContactInformation(phoneNumber: "9876543210", instagramHandle: "@alexjohnson", whatsappNumber: "9876543210"),
        isFavourite: false
    ),
    Pal(
        name: "Charlotte Brown",
        profileImage: "petimage-1",
        rating: 4,
        address: "123 anywhere st. any city state country 123",
        summary: "A cozy home for your pets with lots of toys and space.",
        servicesOffered: [
            ServicesOffered(name: .dayboarding, description: "Comfortable overnight stay", price: "INR 180/Night"),
            ServicesOffered(name: .walking, description: "Enjoyable walks in the park", price: "INR 80/Walk")
        ],
        acceptedPets: ["Dogs", "Cats"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9718, longitude: 77.5943),
        reviews: [
            Review(review: "Loved the care and attention!", rating: 4, username: "Leo Messi", profileImage: "profilepic-3"),
            Review(review: "Charlotte is fantastic with pets.", rating: 5, username: "Neymar Jr", profileImage: "profilepic-4"),
            Review(review: "Very professional and kind.", rating: 4, username: "Cristiano Ronaldo", profileImage: "profilepic-1"),
            Review(review: "Our cat had a great time.", rating: 4, username: "David Beckham", profileImage: "profilepic-2")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "3216549870",
            instagramHandle: "@charlotte_pets",
            whatsappNumber: "7894561230"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Daniel Walker",
        profileImage: "petimage-1",
        rating: 5,
        address: "123 anywhere st. any city state country 123",
        summary: "Passionate about providing the best care and fun for your pets.",
        servicesOffered: [
            ServicesOffered(name: .daycare, description: "Safe and fun pet daycare", price: "INR 130/Day"),
            ServicesOffered(name: .dayboarding, description: "Warm and homely boarding", price: "INR 210/Night")
        ],
        acceptedPets: ["Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9719, longitude: 77.5944),
        reviews: [
            Review(review: "Daniel is amazing with dogs.", rating: 5, username: "Sergio Ramos", profileImage: "profilepic-4"),
            Review(review: "Highly recommend for pet care.", rating: 5, username: "Gerard Pique", profileImage: "profilepic-3"),
            Review(review: "Very attentive and caring.", rating: 5, username: "Karim Benzema", profileImage: "profilepic-2"),
            Review(review: "Our dog loves going there!", rating: 5, username: "Luis Suarez", profileImage: "profilepic-1")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "6543219870",
            instagramHandle: "@danielthedoglover",
            whatsappNumber: "8529637410"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Emily Clark",
        profileImage: "petimage-1",
        rating: 4,
        address: "123 anywhere st. any city state country 123",
        summary: "A pet enthusiast who ensures a happy and safe environment.",
        servicesOffered: [
            ServicesOffered(name: .walking, description: "Scenic and relaxing walks", price: "INR 70/Walk"),
            ServicesOffered(name: .sitting, description: "Dedicated pet sitting", price: "INR 160/Day")
        ],
        acceptedPets: ["Cats", "Dogs"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9722, longitude: 77.5947),
        reviews: [
            Review(review: "Truly cares for animals.", rating: 4, username: "Eden Hazard", profileImage: "profilepic-2"),
            Review(review: "Wonderful experience.", rating: 4, username: "Kylian Mbappe", profileImage: "profilepic-1"),
            Review(review: "Emily is great!", rating: 5, username: "Paul Pogba", profileImage: "profilepic-3"),
            Review(review: "Best sitter we've had.", rating: 4, username: "Antoine Griezmann", profileImage: "profilepic-4")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "9638527410",
            instagramHandle: "@emilyclark_pets",
            whatsappNumber: "1472583690"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Fredrick Wilson",
        profileImage: "petimage-1",
        rating: 3,
        address: "123 anywhere st. any city state country 123",
        summary: "A nature lover offering a pet-friendly space and care.",
        servicesOffered: [
            ServicesOffered(name: .daycare, description: "Attentive and safe daycare", price: "INR 120/Day"),
            ServicesOffered(name: .dayboarding, description: "Comfortable stay for your pet", price: "INR 190/Night")
        ],
        acceptedPets: ["Dogs", "Rabbits"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9723, longitude: 77.5948),
        reviews: [
            Review(review: "Fredrick is very kind.", rating: 3, username: "Harry Kane", profileImage: "profilepic-3"),
            Review(review: "Our rabbit was well cared for.", rating: 4, username: "Raheem Sterling", profileImage: "profilepic-4"),
            Review(review: "A bit pricey but good service.", rating: 3, username: "Jordan Henderson", profileImage: "profilepic-1"),
            Review(review: "Good place for pets.", rating: 3, username: "Marcus Rashford", profileImage: "profilepic-2")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "9876543210",
            instagramHandle: "@fredrick_loves_nature",
            whatsappNumber: "1234567890"
        ),
        isFavourite: false
    ),
    Pal(
        name: "Gina Roberts",
        profileImage: "petimage-1",
        rating: 5,
        address: "123 anywhere st. any city state country 123",
        summary: "Dedicated to providing the best care and affection for your pets.",
        servicesOffered: [
            ServicesOffered(name: .sitting, description: "Loving and attentive sitting", price: "INR 110/Day"),
            ServicesOffered(name: .walking, description: "Fun walks in the park", price: "INR 85/Walk")
        ],
        acceptedPets: ["Cats", "Dogs", "Birds"],
        neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9724, longitude: 77.5949),
        reviews: [
            Review(review: "Fantastic service!", rating: 5, username: "Gareth Bale", profileImage: "profilepic-4"),
            Review(review: "Gina is amazing with pets.", rating: 5, username: "Luka Modric", profileImage: "profilepic-3"),
            Review(review: "Very satisfied with the care.", rating: 5, username: "Toni Kroos", profileImage: "profilepic-2"),
            Review(review: "Highly recommend Gina.", rating: 5, username: "Sergio Aguero", profileImage: "profilepic-1")
        ],
        contactInfo: ContactInformation(
            phoneNumber: "7418529630",
            instagramHandle: "@gina_petcare",
            whatsappNumber: "3692581470"
        ),
        isFavourite: false
    )
    ]
