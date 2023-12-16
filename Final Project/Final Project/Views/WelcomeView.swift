//
//  WelcomeView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("BG1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome to the App!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
//                Spacer()
                
                // Button to get locations by courses
                NavigationLink(destination: courseListApiView()) {                    Text("Get Locations by Courses")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }

                
                // Button to get locations by department
                NavigationLink(destination: ContentView()) {
                    Text("Get Locations by Department")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .padding()
        }
    }
}

//struct LocationsByCoursesView: View {
//    var body: some View {
//        Text("Locations by Courses")
//            .font(.title)
//            .padding()
//    }
//}

struct LocationsByDepartmentView: View {
    var body: some View {
        Text("Locations by Department")
            .font(.title)
            .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
