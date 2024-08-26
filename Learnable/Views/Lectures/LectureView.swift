//
//  LectureView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/19/24.
//
// Lecture View has 3 core parts
// 1. The Topic View
// 2. The ToC view (table of contents)
// 3. The chat View

import Foundation
import SwiftUI

struct LectureView: View {
    
    // @Binding var generatedLecture: GeneratedLectureObject // uncomment after testing
    
    // ///////////////// TEST OBJECT test ///////////////////// //
    let testGeneratedLecture = GeneratedLectureObject(
        subjectTitle: "Algebra",
        blurb: "Dive into the world of Algebra, where numbers and letters come alive in a dance of logic and creativity. This book is your gateway to understanding the foundational concepts that shape our understanding of mathematics. Whether you're a student aiming to master the basics or someone looking to refine your skills, this comprehensive guide simplifies complex ideas and provides practical examples to help you grasp algebraic principles with confidence. From solving equations to understanding functions, 'Algebra Unlocked' makes learning engaging, accessible, and rewarding. Embark on a journey that will enhance your problem-solving abilities and empower you to see the world through a mathematical lens.",
        topics: [
            TopicResponseFormat(
                title: "Linear Equations",
                content: [
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    )
                ]
            ),
            
            TopicResponseFormat(
                title: "Linear Equations",
                content: [
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    )
                ]
            ),
            
            TopicResponseFormat(
                title: "Linear Equations",
                content: [
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    )
                ]
            ),
            
            TopicResponseFormat(
                title: "Linear Equations",
                content: [
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    ),
                    
                    
                    SubTopicResponseFormat(
                        subTopic: "Solving one-variable linear equations",
                        body: "Linear equations in one variable are equations that can be written in the form Ax + B = 0, where A and B are constants, and x is the variable. Let\'s go through the systematic steps needed to solve such equations and look at some examples.\n\nStep-by-Step Process:\n1. **Isolate the variable term**: The first step is to move all terms containing the variable to one side of the equation and the constant terms to the other side. For example, if we have 3x + 5 = 11, we need to subtract 5 from both sides to isolate the variable term: \n3x + 5 - 5 = 11 - 5 \nThis simplifies to: \n3x = 6\n\n2. **Divide by the coefficient**: The next step is to isolate the variable by dividing both sides of the equation by the coefficient of the variable. In our example: \n3x = 6\nWe divide both sides by 3: \n3x / 3 = 6 / 3 \nThis simplifies to: \nx = 2\n\nExamples:\n- Solve 4x - 7 = 9\n  1. Add 7 to both sides: 4x - 7 + 7 = 9 + 7 \n     4x = 16\n  2. Divide both sides by 4: 4x / 4 = 16 / 4 \n     x = 4\n\n- Solve -5x + 8 = -22\n  1. Subtract 8 from both sides: -5x + 8 - 8 = -22 - 8 \n     -5x = -30\n  2. Divide both sides by -5: -5x / -5 = -30 / -5 \n     x = 6\n\nBeyond Simple Equations:\nFor more complex equations that involve parentheses or multiple steps, more actions such as distribution or combining like terms may be necessary. Let’s look at an advanced example.\n\n- Solve 2(3x - 4) + 5 = 17\n  1. Distribute the 2: 6x - 8 + 5 = 17 \n  2. Combine like terms: 6x - 3 = 17\n  3. Add 3 to both sides: 6x - 3 + 3 = 17 + 3 \n     6x = 20\n  4. Divide both sides by 6: 6x / 6 = 20 / 6 \n     x = 10 / 3 or \n     x ≈ 3.33\n\nChecking Your Solution:\nAlways check your solution by plugging the value of x back into the original equation to ensure the left-hand side equals the right-hand side. For our first example (3x + 5 = 11), substituting x = 2 into the original equation yields 3(2) + 5 = 11, which is true."
                    )
                ]
            )
        ]
    )
    
    // //////////////////////////////////////////////////////// // end of test object
    
    @State var isTableOfContentsActive = false
    @State var isChatAssistantActive = false
    @State var initialDragPosition: CGPoint? = nil
    @State var draggingFromEdge: Bool = false
    @State var draggingFromDrawerHandle: Bool = false // tablet of contents drawer handle
    @State var tabletOfContentOffset: CGFloat = -160
    @State var dragDistance: CGPoint = .zero
    @State var initialTableOfContentOffset: CGFloat = .zero // placeholder init value
    
    let tableOfContentWidth: Double = 320
    
    
    var body: some View {
        HStack (spacing: 0){
            
            // Table of Contents
            TableOfContentsView(isActive: $isTableOfContentsActive, width: tableOfContentWidth)
                
            
            // Lecture Viewer
            LectureReaderView(
                isTableOfContentsActive: $isTableOfContentsActive,
                isChatAssistantActive: $isChatAssistantActive,
                data: testGeneratedLecture
            )
           
            // Chat assistant
        }
        //.offset(x: -160)
        .offset(x: tabletOfContentOffset)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    
                    
                    
                    // Set initial touch
                    if initialDragPosition == nil {
                        initialDragPosition = CGPoint(x: value.location.x, y: value.location.y)
                        initialTableOfContentOffset = tabletOfContentOffset
                        
                        // ////// Initial set dragging from edge //////////
                        if value.location.x < 180 && value.location.x >= 160 && !isTableOfContentsActive {
                            draggingFromEdge = true
                            
                        } else if isTableOfContentsActive
                                    && value.location.x >= (tableOfContentWidth + 150)
                                    && value.location.x <= (tableOfContentWidth + 170) {
                            print("clicked the edge")
                            draggingFromDrawerHandle = true
                        }
                        
                        return
                    }
                    
                    dragDistance = CGPoint(
                        x: initialDragPosition!.x - value.location.x,
                        y: initialDragPosition!.y - value.location.y
                    )
                    
                    
                    if draggingFromEdge {
                        print(dragDistance.x)
                        tabletOfContentOffset = -160 + dragDistance.x
                        
                    } else if draggingFromDrawerHandle {
                        print("dragging from the handle \(dragDistance.x)")
                        tabletOfContentOffset = initialTableOfContentOffset + dragDistance.x
                    }
                    
                    
                }.onEnded { value in
                    
                    
                    // Open drawer function
                    if draggingFromEdge && dragDistance.x >= 160 {
                        isTableOfContentsActive = true
                        withAnimation {
                            tabletOfContentOffset = 160
                        }
                    
                    // Close the drawer
                    } else if draggingFromEdge && dragDistance.x < 160 {
                        isTableOfContentsActive = false
                        withAnimation {
                                tabletOfContentOffset = -160
                        }
                    }
                    
                    initialDragPosition = nil
                    draggingFromEdge = false
                    draggingFromDrawerHandle = false
                }
        )
    }
}
  
