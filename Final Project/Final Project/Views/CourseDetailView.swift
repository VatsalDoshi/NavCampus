//
//  CourseDetailView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//


import SwiftUI

struct CourseDetailView: View {
    let course: Course

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: course.imageURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                    case .empty:
                        ProgressView()
                    @unknown default:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                    }
                }
                .padding()

                Text(course.courseName)
                    .font(.largeTitle)
                    .padding()

                Text("Professor: \(course.professor)")
                    .font(.headline)
                    .padding()

                Text("Time: \(course.time)")
                    .font(.headline)
                    .padding()

                Text("Location: \(course.location)")
                    .font(.headline)
                    .padding()

                // Additional details or components can be added here

                NavigationLink(
                    destination: ContentView(), // Replace ContentView() with your maps view
                    label: {
                        Text("View on Maps")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )
                .padding()

                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            .navigationTitle(course.courseName)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: Course(id: "1", courseCategory: "Category", courseName: "Course 1", professor: "Prof. Smith", time: "9:00 AM", location: "Room 101", imageURL: "https://example.com/image.jpg"))
    }
}
