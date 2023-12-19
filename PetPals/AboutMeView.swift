//
//  AboutMeView.swift
//  PetPals
//
//  Created by user2 on 19/12/23.
//

import SwiftUI

struct AboutMeView: View {
    
    @State var Intro = ""
    @State var Experience = ""
    @State var Service = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Introduce yourself and why you enjoy being with with pets ?").bold()){
                        TextField("e.g. I'm a pet lover and I love pets as they are absolutely adorable.",text: $Intro)
                    }
                    Section(header: Text("Tell us about the type of pet you have and your experience with it  ?").bold()){
                        TextField("e.g. I'm a owner of a German Shephard since i was 18,its a wonderful pet.",text: $Experience)
                    }
                    Section(header: Text("How does your Service stand out ?").bold()){
                        TextField("e.g. Tell potential customers why they should choose you ?.",text: $Service)
                    }
                    
                    Section(header: Text("Your skills and qualifications?").bold()){
                        TextField("e.g. Tell about your skills and qualifications ?.",text: $Service)
                    }
                    
                    Section(header: Text("Other special skills and qualifications ?").bold()){
                        TextField("e.g. Tell us about your other experience in training, grooming etc .",text: $Service)
                    }
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Save")
                        .frame(width: 380,
                               height: 50,
                               alignment: .center)
                        .background(Color.appBrown)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .navigationTitle("About Me")
        }
    }
}

#Preview {
    AboutMeView()
}
