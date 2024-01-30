import SwiftUI

struct RegistrationBoxView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.pink.opacity(0.1))
                .frame(height: 170)
                .padding(.horizontal)
            
            VStack{
                VStack(alignment: .leading ,spacing: 3){
                    Text("Register your service")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .padding(.horizontal,30)
                    
                    Text("Earn extra income and unlock new opportunities by offering your services and love to the pets.")
                        .font(.caption)
                        .padding(.horizontal,30)
                }
                
                .padding(.bottom)
                
                NavigationLink(destination:JobsServicesView()){
                    Text("Register Now")
                        .foregroundStyle(.black)
                        .frame(width: 340,height: 40)
                        .background(.orange.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                .padding(.horizontal,30)
            }
        }
    }
}

#Preview {
    RegistrationBoxView()
}
