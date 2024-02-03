import SwiftUI

struct RegistrationBoxView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.appBrown)
                .frame(height: 170)
                .padding(.horizontal)
            
            VStack{
                VStack(alignment: .leading ,spacing: 3){
                    Text("Register your service")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .padding(.horizontal,30)
                    
                    Text("Earn extra income and unlock new opportunities by offering your services and love to the pets.")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding(.horizontal,30)
                }
                
                .padding(.bottom)
                
                NavigationLink(destination:OnboardingQuestionnaireView()){
                    Text("Register Now")
                        .foregroundStyle(.white)
                        .frame(width: 340,height: 40)
                        .background(.appYellow)
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
