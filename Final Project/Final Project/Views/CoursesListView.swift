//
//  CoursesListView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/15/23.
//

import SwiftUI

struct CoursesListView: View {
    @State private var searchQuery = ""
    let courses: [String] // Assuming you have an array of course names

    var filteredCourses: [String] {
        if searchQuery.isEmpty {
            return courses
        } else {
            return courses.filter { $0.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredCourses, id: \.self) { course in
                Text(course)
            }
            .navigationBarTitle("Courses")
            .searchable(text: $searchQuery)
        }
    }
}



