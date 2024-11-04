import SwiftUI

struct ExploreScreen: View {
    @State private var showAddTaskScreen = false // State variable to control the sheet
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    VStack {
                        Text("Have a great day!")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color("FitSyncBlue2"))
                                .frame(width: 280, height: 240)
                                .cornerRadius(20)
                                .padding()
                            
                            VStack {
                                Image(.logo)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(40)
                                
                                Text("Create your schedule")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                
                                Button("Get started") {
                                    showAddTaskScreen = true // Show the sheet
                                }
                                .foregroundColor(.white)
                                .buttonStyle(.bordered)
                                .background(.fitSyncOrange)
                                .cornerRadius(10)
                                .frame(width: 200, height: 41)
                                .sheet(isPresented: $showAddTaskScreen) {
                                    AddTaskScreen() // Present AddTaskScreen as a sheet
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        HStack(spacing: 170) {
                            Text("Exercises")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            
                            NavigationLink(destination: AllSportsScreen()) {
                                Text("See All")
                                    .font(.title2)
                                    .foregroundColor(.fitSyncOrange)
                            }
                            .buttonStyle(PlainButtonStyle()) // Makes it look like text
                        }
                        .padding()
                        
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
                                        
                                        Label("80 - 120 Cal" ,systemImage: "flame")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                }.padding(.leading, 10)
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 100, height: 100)
                                    
                                    Image(.running)
                                        .resizable()
                                        .frame(width: 80, height: 90)
                                }
                                .padding(.trailing, 13.0)
                            }
                            .padding(.leading, 0.0)
                        }
                        .padding(.bottom, 8)
                        ZStack {
                            Rectangle()
                                .fill(Color.fitSyncBlue2)
                                .frame(width: 350, height: 110)
                                .cornerRadius(20)
                            
                            HStack(spacing: 50) {
                                VStack(alignment: .leading) {
                                    Text("Weight lift")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.fitSyncBlue1)
                                            .frame(width: 150, height: 25)
                                            .cornerRadius(20)
                                        
                                        Label("180 - 120 Cal" ,systemImage: "flame")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                }.padding(.leading, 10)
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.fitSyncBlue2, .fitSyncBlue0]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 100, height: 100)
                                    
                                    Image(.weightLifting)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                }
                                .padding(.trailing, 13.0)
                            }
                            .padding(.leading, 0.0)
                        }
                    }
                    .navigationBarBackButtonHidden(false)
                }
                .padding(.top, 40.0)}}}}
#Preview {
    ExploreScreen()
}
