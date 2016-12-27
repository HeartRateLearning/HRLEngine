//
//  Engine.swift
//  Pods
//
//  Created by Enrique de la Torre (dev) on 22/12/2016.
//
//

import Foundation
import HRLAlgorithms

public class Engine {
    private let classifier = HRLKNNClassifier()

    func train(with dataFrame:DataFrame) {
        let matrix = HRLMatrix()
        matrix.fill(with: dataFrame)

        classifier.train(with: matrix)
    }

    func predictedWorkingOut(for record:Record) -> Bool {
        let predictedClass = classifier.predictClass(for: record)
        let workingOut = WorkingOut(rawValue: predictedClass)!

        return Bool(workingOut)
    }
}
