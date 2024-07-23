//
//  File.swift
//  Learnable
//
//  Created by Bryan Mina on 7/8/24.
//

import Foundation

class SubjectsViewModel: SingletonViewModel, ObservableObject {
    static var shared = SubjectsViewModel()
    
    @Published var subjects: [SubjectModel] = [
        SubjectModel(title: "Algebra", chapterCount: 5, completionPercentage: 89, lastRead: Date()),
        
        SubjectModel(title: "Physics", chapterCount: 3, completionPercentage: 10, lastRead: Date()),
        
        SubjectModel(title: "Rocket Science", chapterCount: 10, completionPercentage: 80, lastRead: Date())
    ]
    
    func deleteSubject(obj: SubjectModel) {
        let i = self.subjects.firstIndex(of: obj)
        
        guard let index = i else {
            print("object: \(obj) is not an element in subjects. Not deleting anything")
            return
        }
        
        self.subjects.remove(at: index)
    }
    
    func addSubject(obj: SubjectModel) {
        self.subjects.append(obj)
    }
}

struct SubjectModel: Hashable {
    var title: String
    var chapterCount: Int
    var completionPercentage: Double
    var lastRead: Date
}
