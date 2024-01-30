import SwiftUI

struct OptionsContainerView: View {
    var body: some View {
        VStack(spacing: 1) {
            OptionsView(title: "My Address", icon: "location")
            Divider()
            OptionsView(title: "Payment", icon: "creditcard")
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5)
        )
    }
}

struct OptionsView: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
                .padding(.horizontal)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding(.horizontal)
        )
    }
}

#Preview {
    OptionsContainerView()
}
