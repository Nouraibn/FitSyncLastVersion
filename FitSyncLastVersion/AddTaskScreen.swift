import SwiftUI

struct AddTaskScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    @State private var selectedStartHour = Date()
    @State private var selectedEndHour = Date() // Separate state for end time
    @State private var isDailyTask: Bool = true // State for the toggle
    @State private var showAddMoreSheet = false // State to manage sheet presentation

    var body: some View {
        ZStack {
            Color.fitSyncBlue2
                .ignoresSafeArea()
            
            VStack {
                HStack(spacing: 230.0) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Close the sheet
                    }) {
                        Text("Cancel")
                            .foregroundColor(.fitSyncOrange)
                    }
                    
                    Button(action: {
                        // Navigate to ScheduleScreen
                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                        let window = windowScene?.windows.first
                        let scheduleView = ScheduleScreen()
                        window?.rootViewController = UIHostingController(rootView: scheduleView)
                        window?.makeKeyAndVisible()
                    }) {
                        Text("Save")
                            .foregroundColor(.fitSyncOrange)
                    }
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.fitSyncBlue1)
                        .frame(width: 320, height: 70)
                        .cornerRadius(20)
                    Text("New Task")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top)
                
                ZStack {
                    Rectangle()
                        .fill(Color.fitSyncBlue1)
                        .frame(width: 320, height: 480)
                        .cornerRadius(20)
                    VStack(spacing: 55.0) {
                        VStack {
                            Text("Task Name")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.trailing, 190.0)
                                .multilineTextAlignment(.leading)
                            
                            TextField("Name", text: $text)
                                .textCase(.lowercase)
                                .padding()
                                .frame(width: 280, height: 50)
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .textFieldStyle(PlainTextFieldStyle())
                                .foregroundColor(.black) // Set text color to black
                        }
                        
                        VStack(spacing: 10.0) {
                            Text("Task Type")
                                .padding(.trailing, 190.0)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Toggle(isOn: $isDailyTask) {
                                Text("Daily Task")
                                    .font(.callout)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 70.0)
                            .toggleStyle(SwitchToggleStyle(tint: .fitSyncOrange)) // Customize toggle style
                        }
                        
                        VStack(spacing: 15.0) {
                            Text("Time")
                                .padding(.trailing, 220.0)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack(spacing: 130.0) {
                                Text("Start")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .padding(.leading, 90.0)
                                
                                Text("End")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 100.0)
                            }
                            
                            HStack {
                                DatePicker("", selection: $selectedStartHour, displayedComponents: .hourAndMinute)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .labelsHidden()
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                Text("-")
                                    .foregroundColor(.fitSyncOrange)
                                DatePicker("", selection: $selectedEndHour, displayedComponents: .hourAndMinute)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .labelsHidden()
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                            }
                            .padding(.horizontal, 51.0)
                        }
                        .padding(.top, 6.0)
                    }
                    .padding(.bottom, 11.0)
                }
                
                Button(action: {
                    showAddMoreSheet = true // Show the sheet when button is tapped
                }) {
                    Text("Add More")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 320, height: 70)
                        .background(Color.fitSyncOrange)
                        .cornerRadius(20)
                }
                .padding(.top, 20.0)
            }
            .padding(.top, 60)
        }
        .sheet(isPresented: $showAddMoreSheet) {
            AddTaskScreen() // Present the same screen as a sheet
        }
    }
}

#Preview {
    AddTaskScreen()
}
