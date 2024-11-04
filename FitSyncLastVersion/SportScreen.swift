import SwiftUI

struct SportScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    @State private var selectedStartHour = Date()
    @Binding var freeTimeTask: String? // Binding to update the free time task

    var body: some View {
        ZStack {
            Color.fitSyncBlue2
                .ignoresSafeArea()
            VStack(spacing: -680) {
                HStack(spacing: 230.0) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Close the sheet
                    }) {
                        Text("Cancel")
                            .foregroundColor(.fitSyncOrange)
                    }

                    Button(action: {
                        // Set the free time task to "Crunches"
                        freeTimeTask = "Crunches"
                        presentationMode.wrappedValue.dismiss() // Close the sheet after adding
                    }) {
                        Text("Add")
                            .foregroundColor(.fitSyncOrange)
                    }
                }
                .padding(.bottom, 700.0)

                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue1)
                            .frame(width: 320, height: 110)
                            .cornerRadius(20)
                        HStack {
                            VStack {
                                Text("Crunches")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 160.0)
                                    .multilineTextAlignment(.leading)
                                ZStack {
                                    Rectangle()
                                        .fill(Color.fitSyncBlue2)
                                        .frame(width: 150, height: 25)
                                        .cornerRadius(20)
                                    Label("150 - 160 Cal", systemImage: "flame")
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 120.0)
                            }
                        }

                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 500, height: 100)
                                .padding(.leading, 210.0)
                            Image(.crunches) // Correctly passing the image name as a string
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.leading, 210.0)
                        }
                    }
                    .padding(.top)

                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue1)
                            .frame(width: 320, height: 500)
                            .cornerRadius(20)
                        VStack(spacing: 55.0) {
                            VStack (spacing : 1){
                Text("The crunch or curl-up is an abdominal exercise that works the rectus abdominis muscle.\nIt enables both building and defining 'six-pack' abs and tightening the belly. ")
                        .font(.subheadline).foregroundColor(.primary) // Set the text color
                        .padding() // Add
                .frame(width: 320) // Set the
                        .cornerRadius(10)
                                Text("How to do Crunches?")
                                    
                                        .font(.subheadline)
                                        .foregroundColor(.fitSyncOrange)// Set the text color
                                        .multilineTextAlignment(.leading)
                                        .padding(.trailing, 135.0)
                                    
                                    
                                    Text("1. Lie down on your back.\n\n2. Bend your legs and stabilize your lower body.\n\n3. Cross your hands to opposite shoulders, or place them behind your ears without pulling on your neck.\n\n4. Lift your head and shoulder blades from the ground. Exhale as you rise.\n\n5. Lower, returning to your starting point. Inhale as you lower.")
                                        .font(.subheadline).foregroundColor(.primary) // Set the text color
                                        .padding() // Add
                                        .frame(width: 320) // Set the
                                    .cornerRadius(10)}
                            .padding(.top, 5.0)
                            }
                            .padding(.top, 0.0)
                        
                    }
                    .padding(.top, 9.0)
                }
            }
            .padding(.top, 40.0)
        }
    }
}

#Preview {
    SportScreen(freeTimeTask: .constant(nil))
}
