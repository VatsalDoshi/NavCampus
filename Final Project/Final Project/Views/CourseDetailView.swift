//
//  CourseDetailView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

//import SwiftUI
//
//struct CourseDetailView: View {
//    let course: Course
//    @State private var isNavigationActive: Bool = false
//    
//    var body: some View {
//        ScrollView{
//        VStack {
//            // Display course image using AsyncImage
//            AsyncImage(url: URL(string: course.imageURL)) { phase in
//                switch phase {
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200) // Adjust size as needed
//                        .cornerRadius(10)
//                case .failure(_):
//                    // Placeholder or error handling image
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
//                        .foregroundColor(.gray)
//                        .cornerRadius(10)
//                case .empty:
//                    // Placeholder or loading state image
//                    ProgressView()
//                @unknown default:
//                    // Placeholder or default image
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
//                        .foregroundColor(.gray)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//
//            Text(course.courseName)
//                .font(.largeTitle)
//                .padding()
//            
//            Text("Professor: \(course.professor)")
//                .font(.headline)
//                .padding()
//            
//            Text("Time: \(course.time)")
//                .font(.headline)
//                .padding()
//            
//            Text("Location: \(course.location)")
//                .font(.headline)
//                .padding()
//
//            // Additional details or components can be added here
//            
//            Button(action: {
//                
//                                // Handle button tap action, e.g., navigate to ContentView (maps view)
//                    isNavigationActive = true
//                }) {
//                    Text("View on Maps")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                Spacer()
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(20)
//            .padding()
//            .navigationTitle(course.courseName)
//            .sheet(isPresented: $isNavigationActive) {
//                ContentView() // ContentView should be replaced with your maps view
//            }
//            .navigationTitle("Course Details")
//        }
//    }
//}
////        }
////        .navigationTitle("Course Details")
////    }
////}
//
//struct CourseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseDetailView(course: Course(id: "1", courseCategory: "Category", courseName: "Course 1", professor: "Prof. Smith", time: "9:00 AM", location: "Room 101", imageURL: "https://example.com/image.jpg"))
//    }
//}

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
