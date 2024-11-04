import SwiftUI

struct RecommendationScreen: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Binding var freeTimeTask: String? // Bind to receive the task
    @State private var showSportScreen = false // State to control sheet presentation

    var body: some View {
        NavigationView {
            ScrollView {
                Text("Recommendation")
                    .font(.title)

                VStack(spacing: 15) {
                    HStack(spacing: 130) {
                        Label("10 - 30 min", systemImage: "")
                            .font(.title3)
                            .foregroundColor(.fitSyncBlue1)
                            .frame(width: 170)

                        NavigationLink(destination: AllSportsScreen()) {
                            Text("See All")
                                .foregroundColor(.fitSyncOrange)
                                .font(.title2)
                        }
                        .frame(width: 100)
                    }
                    .padding(.trailing, 24.0)

                    // Button for Crunches to update freeTimeTask and show the SportScreen
                    Button(action: {
                        freeTimeTask = "Crunches" // Update the free time task
                        showSportScreen.toggle() // Present the SportScreen
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(Color.fitSyncBlue2)
                                .frame(width: 350, height: 110)
                                .cornerRadius(20)

                            HStack(spacing: 50) {
                                VStack(alignment: .leading) {
                                    Text("Crunches")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)

                                    ZStack {
                                        Rectangle()
                                            .fill(Color.fitSyncBlue1)
                                            .frame(width: 150, height: 25)
                                            .cornerRadius(20)

                                        Label("150 - 160 Cal", systemImage: "flame")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                }
                                .padding(.leading, 10)

                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 100, height: 100)

                                Image(.crunches)
                            .resizable()
                    .frame(width: 80, height: 80)
                                }
                                .padding(.trailing, 13.0)
                            }
                            .padding(.leading, 0.0)
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // Keep design without button styling
                    .sheet(isPresented: $showSportScreen) {
                        SportScreen(freeTimeTask: $freeTimeTask) // Present SportScreen with binding
                    }

                    // Other exercise sections remain unchanged...
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue2)
                            .frame(width: 350, height: 110)
                            .cornerRadius(20)

                        HStack(spacing: 50) {
                            VStack(alignment: .leading) {
                                Text("Sit Up")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)

                                ZStack {
                                    Rectangle()
                                        .fill(Color.fitSyncBlue1)
                                        .frame(width: 150, height: 25)
                                        .cornerRadius(20)

                                    Label("180 - 120 Cal", systemImage: "flame")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.leading, 10)

                            ZStack {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 100, height: 100)

                                Image(.sitUp) // Ensure the correct image name as a string
                                    .resizable()
                                    .frame(width: 80, height: 80)
                            }
                            .padding(.trailing, 13.0)
                        }
                        .padding(.leading, 0.0)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue2)
                            .frame(width: 350, height: 110)
                            .cornerRadius(20)

                        HStack(spacing: 50) {
                            VStack(alignment: .leading) {
                                Text("High Knees")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)

                                ZStack {
                                    Rectangle()
                                        .fill(Color.fitSyncBlue1)
                                        .frame(width: 150, height: 25)
                                        .cornerRadius(20)

                                    Label("200 - 220 Cal", systemImage: "flame")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.leading, 10)

                            ZStack {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 100, height: 100)

                                Image(.highKnees) // Ensure the correct image name as a string
                                    .resizable()
                                    .frame(width: 80, height: 80)
                            }
                            .padding(.trailing, 13.0)
                        }
                        .padding(.leading, 0.0)
                    }

                    // Continue with the remaining sections for "30 - 60 min"
                    Label("30 - 60 min", systemImage: "")
                        .font(.title3)
                        .foregroundColor(.fitSyncBlue1)
                        .padding(.trailing, 240)
                        .padding(.top, 9)

                    // Example for Running
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue2)
                            .frame(width: 350, height: 110)
                            .cornerRadius(20)

                        HStack(spacing: 50) {
                            VStack(alignment: .leading) {
                                Text("Running")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)

                                ZStack {
                                    Rectangle()
                                        .fill(Color.fitSyncBlue1)
                                        .frame(width: 150, height: 25)
                                        .cornerRadius(20)

                                    Label("80 - 120 Cal", systemImage: "flame")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.leading, 10)

                            ZStack {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 100, height: 100)

                                Image(.running) // Ensure the correct image name as a string
                                    .resizable()
                                    .frame(width: 80, height: 90)
                            }
                            .padding(.trailing, 13.0)
                        }
                        .padding(.leading, 0.0)
                    }

                    // Example for HIIT
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue2)
                            .frame(width: 350, height: 110)
                            .cornerRadius(20)

                        HStack(spacing: 50) {
                            VStack(alignment: .leading) {
                                Text("HIIT")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)

                                ZStack {
                                    Rectangle()
                                        .fill(Color.fitSyncBlue1)
                                        .frame(width: 150, height: 25)
                                        .cornerRadius(20)

                                    Label("190 - 200 Cal", systemImage: "flame")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.leading, 10)

                            ZStack {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 100, height: 100)

                                Image(.hit1) // Ensure the correct image name as a string
                                    .resizable()
                                    .frame(width: 80, height: 80)
                            }
                            .padding(.trailing, 13.0)
                        }
                        .padding(.leading, 0.0)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color("FitSyncOrange"))
                }
            }
        }
    }
}

#Preview {
    RecommendationScreen(freeTimeTask: .constant(nil)) // Provide a constant binding for preview
}
