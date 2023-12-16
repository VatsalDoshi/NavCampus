//
//  courseListApiView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import SwiftUI

struct courseListApiView: View {
    
    @State private var courses: [Course] = []
    private let courseService = CourseService()
    
    var body: some View {
        List(courses) { course in
                VStack(alignment: .leading) {
                    Text(course.courseName)
                        .font(.headline)
                    Text("Professor: \(course.professor)")
                    Text("Time: \(course.time)")
                    Text("Location: \(course.location)")
                    
                    // Display course image using AsyncImage
                    AsyncImage(url: URL(string: course.imageURL)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100) // Adjust size as needed
                        case .failure(_):
                            // Placeholder or error handling image
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        case .empty:
                            // Placeholder or loading state image
                            ProgressView()
                        @unknown default:
                            // Placeholder or default image
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .onAppear {
                fetchCourses()
            }
        }

        private func fetchCourses() {
            courseService.fetchCourses { fetchedCourses in
                if let fetchedCourses = fetchedCourses {
                    courses = fetchedCourses
                }
            }
        }
    }


#Preview {
    courseListApiView()
}
