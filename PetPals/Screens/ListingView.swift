import SwiftUI

struct ListingView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.yellow.opacity(1))
                .frame(height: 230)
                .padding(.bottom, 550)
                .edgesIgnoringSafeArea(.top)
                
            VStack {
                Text("My Bookings")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 5) // Reduced bottom padding
            
                Picker(selection: $selectedTab, label: Text("")) {
                    Text("Current Bookings")
                        .tag(0)
                    Text("Past Bookings")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.orange)
                .cornerRadius(20)
                .padding(.top)
                .padding(.bottom, 10) // Reduced bottom padding
                
                // Tabs content based on selection
                ScrollView{
                    if selectedTab == 0 {
                        Text("No Current Bookings Found.")
                            .padding(.top, 30)
                        
                    } else {
                        Text("No Past Bookings Found.")
                            .padding(.top, 30)
                    }
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ListingView()
}
