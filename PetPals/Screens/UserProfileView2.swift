import SwiftUI

struct UserProfileView2: View {
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.top, 20)
            
            Text("John Doe")
                .font(.title)
                .padding(.top, 10)
            
            Text("john.doe@email.com")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            Divider()
                .padding(.vertical, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Account Details")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                HStack {
                    Text("Mobile Number:")
                    Spacer()
                    if isEditing {
                        TextField("+1 123 456 7890", text: .constant(""))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    } else {
                        Text("+1 123 456 7890")
                    }
                    EditButton()
                }
                
                HStack {
                    Text("Email:")
                    Spacer()
                    if isEditing {
                        TextField("john.doe@email.com", text: .constant(""))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    } else {
                        Text("john.doe@email.com")
                    }
                    EditButton()
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Profile", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            isEditing.toggle()
        }) {
            Text(isEditing ? "Done" : "Edit")
        })
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView2()
    }
}
