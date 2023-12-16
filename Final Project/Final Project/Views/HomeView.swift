//
//  HomeView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView()) {
                    Text("Go to Map View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: CoursesListView(courses: ["Course 1", "Course 2", "Course 3"])) {
                    Text("Go to Courses List")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationBarTitle("Home")
        }
    }
}


#Preview {
    HomeView()
}
