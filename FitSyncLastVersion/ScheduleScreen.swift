import SwiftUI

struct Task {
    var name: String
    var startTime: Int
    var endTime: Int
}

struct ScheduleScreen: View {
    @State private var tasks: [Task] = []
    @State private var taskName: String = ""
    @State private var taskStartTime: String = ""
    @State private var taskEndTime: String = ""
    @State private var task1: String = "Work"
    @State private var freeTimeTask: String? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    headerView
                    scheduleView
                    exercisesView
                }
            }
            .padding(.top, 40)
        }
    }
    
    private var headerView: some View {
        VStack {
            Text("Have a great day!")
                .foregroundColor(.white)
                .font(.largeTitle.bold())
                .padding(.bottom, 40)
            
            HStack(spacing: 170) {
                Text("Your Schedule")
                    .font(.title2.bold())
                Button(action: {}) {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 27, height: 29)
                        .foregroundColor(.fitSyncOrange)
                }
            }
        }
    }
    
    private var scheduleView: some View {
        HStack(spacing: 10) {
            timeSlots
            tasksList
        }
        .padding(.leading, 20)
    }
    
    private var timeSlots: some View {
        VStack (spacing: -4){
            ForEach(6..<12) { hour in
                Text("\(hour):00")
                    .padding(.bottom, hour == 11 ? 25 : 35)
            }
        }
    }
    
    private var tasksList: some View {
        VStack(alignment: .center, spacing: 10) {
taskView(taskName: task1, time: "6:00-7:00")
taskView(taskName: "Classes", time: "6:00-7:00")
            freeTimeView
        }
    }
    
    private func taskView(taskName: String, time: String) -> some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(taskName).multilineTextAlignment(.center).bold()
                Text(time).bold().multilineTextAlignment(.center)
                    .foregroundStyle(Color.fitSyncBlue1)
            }
          
        }
        .frame(width: 270, height: 100)
        .background(Color.fitSyncBlue2)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var freeTimeView: some View {
        HStack {
            VStack {
                if let task = freeTimeTask {
                    Text(task).bold()
                    Text("10:00-11:00").bold().foregroundStyle(Color.fitSyncBlue1)
                } else {
                    freeTimePlaceholder
                }
            }
            .padding(.trailing, 9)
        }
        .frame(width: 270, height: 100)
        .background(freeTimeTask != nil ? Color.fitSyncOrange : Color.fitSyncBlue2)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var freeTimePlaceholder: some View {
        VStack(spacing: 1) {
            Text("Free time").bold()
            Text("10:00-11:00").bold().foregroundStyle(Color.fitSyncBlue1)

            HStack {
                                   
                NavigationLink(destination: RecommendationScreen(freeTimeTask: $freeTimeTask)) {
                    Text("Recommendation")
                        .font(.caption2.bold())
                        .buttonStyle(.bordered)
                        .frame(width: 105, height: 21)
                        .foregroundColor(.white)
                        .background(Color.fitSyncOrange)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 6)
           
          
        }
    }
    
    private var exercisesView: some View {
        VStack(spacing: 20) {
            HStack(spacing: 160) {
                Text("Exercises").font(.title2.bold())
                NavigationLink(destination: AllSportsScreen()) {
                    Text("See All")
                        .foregroundStyle(Color.fitSyncOrange)
                        .font(.title2)
                }
            }
            .padding(.top)

            exerciseCard(title: "Running", calories: "80 - 120 Cal", image: Image(.running))
            exerciseCard(title: "Weight Lift", calories: "180 - 120 Cal", image: Image(.weightLifting))
        }
    }
    
    private func exerciseCard(title: String, calories: String, image: Image) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.fitSyncBlue2)
                .frame(width: 350, height: 110)
                .cornerRadius(20)
            
            HStack(spacing: 50) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.fitSyncBlue1)
                            .frame(width: 150, height: 25)
                            .cornerRadius(20)
                        
                        Label(calories, systemImage: "flame")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                .padding(.leading, 10)
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 100, height: 100)
                    
                    image
                        .resizable()
                        .frame(width: 80, height: 90)
                }
                .padding(.trailing, 13)
            }
        }
    }
}

#Preview {
    ScheduleScreen()
}
