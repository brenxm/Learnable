//
//  MyProgressViewModel.swift
//  Learnable
//
//  Created by Bryan Mina on 7/9/24.
//

import Foundation

class MyProgressViewModel: SingletonViewModel {
    static var shared = MyProgressViewModel()
    
    var correctAnswer: Int = 1200
    var totalQuestion: Int = 1300
    var booksGenerated: Int = 15
    var booksCompleted: Int = 10
    var datesTestTaken: [Date] = []
    var quizDaysStreak: Int = 0
    var oneHourLectureDaysStreak: Int = 0
    var datesOneHourLectureCompleted: [Date] = []
    
    // To determine if date is not taken, get user's local current date and traceback past dates that are marked completed for past 7 days, the missed dates are not completed.
}
