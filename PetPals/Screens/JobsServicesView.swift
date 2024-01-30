//  JobsServicesView.swift
//  PetPals
//
//  Created by Avya Rathod on 21/12/23.
//

import SwiftUI

struct JobsServicesView: View {
    let services: [Service] = [
        Service(img: "pawprint", title: "Pet Boarding", description: "Perfect if the pet needs overnight pet care"),
        Service(img: "pawprint", title: "Pet Day Care", description: "Day-time pet care in the pet sitter's friendly home"),
        Service(img: "pawprint", title: "Pet Sitting", description: "For pets that need drop ins at their home or house-sitting services overnight"),
        Service(img: "pawprint", title: "Dog Walking", description: "For dogs that need a walk or two")
    ]

    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 15){
                ForEach(services) { service in
                    NavigationLink(destination: AboutMeView(service: service)) {
                        ServicePlacardView(service: service)
                    }
                }
                .navigationTitle("Services")
            }
        }
    }
}

struct ServiceDetailView: View {
    let service: Service

    var body: some View {
        Text("Details for \(service.title)")
            // Add your detailed view content here
    }
}

struct JobsServicesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobsServicesView()
        }
    }
}
