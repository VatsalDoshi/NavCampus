//
//  courseListApiView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import SwiftUI

struct courseListApiView: View {
    
    @State private var courses: [Course] = []
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @State private var selectedCourse: Course?
    private let courseService = CourseService()

    var body: some View {
        NavigationView {
            List {
                SearchBar(text: $searchText, isSearching: $isSearching)

                ForEach(filteredCourses) { course in
                    NavigationLink(destination: CourseDetailView(course: course), tag: course, selection: $selectedCourse) {
                        CourseCell(course: course)
                    }
                    .onTapGesture {
                        selectedCourse = course
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Courses")
            .onAppear {
                fetchCourses()
            }
        }
    }

    private var filteredCourses: [Course] {
        if searchText.isEmpty {
            return courses
        } else {
            return courses.filter { $0.courseName.lowercased().contains(searchText.lowercased()) }
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

struct CourseListApiView_Previews: PreviewProvider {
    static var previews: some View {
        courseListApiView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search for a course", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .padding(.trailing, 4)

                        if isSearching && !text.isEmpty {
                            Button(action: {
                                text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button(action: {
                    isSearching = false
                    text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
                .padding(.trailing, 10)
            }
        }
        .animation(.default)
    }
}

struct CourseCell: View {
    let course: Course

    var body: some View {
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
        .padding()
    }
}


#Preview {
    courseListApiView()
}
