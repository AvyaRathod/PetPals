import SwiftUI

struct MyFavTabView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 120)
                .padding(.horizontal)
                .cornerRadius(12)
                .shadow(radius: 5)
                .foregroundColor(.white)

            HStack(spacing: 30) {
                NavigationLink(destination: FavPalView()) {
                    VStack {
                        Text("❤️")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.appBlue)
                            .clipShape(Circle())
                        Text("Favourites")
                            .foregroundColor(.primary)
                            .font(.headline)
                    }
                }

                NavigationLink(destination: ListingView()) {
                    VStack {
                        Text("👩‍💻")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.appGreen)
                            .clipShape(Circle())
                        Text("Help Center")
                            .foregroundColor(.primary)
                            .font(.headline)
                    }
                }

                NavigationLink(destination: ListingView()) {
                    VStack {
                        Text("📝")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.appOrange)
                            .clipShape(Circle())
                        Text("My Listings")
                            .foregroundColor(.primary)
                            .font(.headline)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

extension Color {
    static let appBlue = Color("AppBlue")
    static let appGreen = Color("AppGreen")
    static let appOrange = Color("AppOrange")
}

struct MyFavTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavTabView()
    }
}
