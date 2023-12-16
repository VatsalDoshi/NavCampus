//
//  CourseService.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import Foundation

class CourseService {
    func fetchCourses(completion: @escaping ([Course]?) -> Void) {
        guard let url = URL(string: "https://656be8c3e1e03bfd572de415.mockapi.io/collegeAPI/V1/courseList") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let courses = try JSONDecoder().decode([Course].self, from: data)
                    completion(courses)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
