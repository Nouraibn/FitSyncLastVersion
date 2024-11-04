import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let duration: String
    let calories: String
}

struct AllSportsScreen: View {
    @State private var showSportScreen = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var freeTimeTask: String? = nil // Track the selected exercise task

    let exercises: [Exercise] = [
        Exercise(name: "Sit Up", duration: "", calories: "80-120 Cal"),
        Exercise(name: "Push Up", duration: "", calories: "100-120 Cal"),
        Exercise(name: "Burpees", duration: "", calories: "180-200 Cal"),
        Exercise(name: "Climbers", duration: "", calories: "150-180 Cal"),
        Exercise(name: "Crunches", duration: "", calories: "150-160 Cal"),
        Exercise(name: "HIIT", duration: "", calories: "190-210 Cal"),
        Exercise(name: "Plank", duration: "", calories: "140-180 Cal"),
        Exercise(name: "High Knees", duration: "", calories: "200-220 Cal"),
        Exercise(name: "Wall Sit", duration: "", calories: "150-170 Cal"),
        Exercise(name: "Weight Lift", duration: "", calories: "120-180 Cal"),
        Exercise(name: "Running", duration: "", calories: "120-80 Cal")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("All Sports")
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                    .padding(.top, -10)
                
                ForEach(exercises) { exercise in
                    if exercise.name == "Crunches" {
                        // Wrap the Crunches row in a Button
                        Button(action: {
                            freeTimeTask = exercise.name // Set the freeTimeTask to the selected exercise
                            showSportScreen.toggle()
                        }) {
                            ExerciseRow(exercise: exercise)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                        }
                        .buttonStyle(PlainButtonStyle()) // Keep design without button styling
                        .sheet(isPresented: $showSportScreen) {
                            SportScreen(freeTimeTask: $freeTimeTask) // Pass the binding to SportScreen
                        }
                    } else {
                        ExerciseRow(exercise: exercise)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                }
            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline) // Keeps the title inline
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color("FitSyncOrange")) // Ensure the color is defined in assets
                }
            }
        }
    }
}

struct ExerciseRow: View {
    let exercise: Exercise
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("FitSyncBlue2"))
                .frame(width: 350, height: 110)
                .cornerRadius(20)
            
            HStack(spacing: 50) {
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

                    ZStack {
                        Rectangle()
                            .fill(Color("FitSyncBlue1"))
                            .frame(width: 150, height: 25)
                            .cornerRadius(20)
                        
                        Label(exercise.calories, systemImage: "flame")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                .padding(.leading, 10)
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 100, height: 100)
                    
                    let imageName = exerciseImageName(for: exercise.name)
                    Image(imageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                .padding(.trailing, 13.0)
            }
            .padding(.leading, 0.0)
        }
    }
    
    private func exerciseImageName(for exerciseName: String) -> String {
        switch exerciseName {
        case "Sit Up": return "SitUp"
        case "Push Up": return "PushUp"
        case "Burpees": return "Burpees"
        case "Climbers": return "Climbers"
        case "Crunches": return "Crunches"
        case "HIIT": return "Hit1"
        case "Plank": return "Plank"
        case "High Knees": return "High Knees"
        case "Wall Sit": return "Wall Sit"
        case "Weight Lift": return "Weight Lifting"
        case "Running": return "Running"
        default: return "default_image" // Fallback image name
        }
    }
}

#Preview {
    AllSportsScreen()
}
