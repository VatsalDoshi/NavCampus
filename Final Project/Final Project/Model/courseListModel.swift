//
//  courseListModel.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import Foundation

struct Course: Identifiable, Decodable, Hashable {
    let id: String
    let courseCategory: String
    let courseName: String
    let professor: String
    let time: String
    let location: String
    let imageURL: String // URL for the course image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.id == rhs.id
    }
}
