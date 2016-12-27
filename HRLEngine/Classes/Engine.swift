//
//  Engine.swift
//  Pods
//
//  Created by Enrique de la Torre (dev) on 22/12/2016.
//
//

import Foundation
import HRLAlgorithms

/// Train an `Engine` with a `Dataframe` and then pass it a `Record`
/// to predict if a person was working out or not.
public class Engine {
    private let classifier = HRLKNNClassifier()

    /**
        In order to make predictions, you have to train the `Engine` with this method.
     
        - Parameter dataFrame: A `DataFrame` instance
     */
    func train(with dataFrame:DataFrame) {
        let matrix = HRLMatrix()
        matrix.fill(with: dataFrame)

        classifier.train(with: matrix)
    }

    /**
        Once the `Engine` is trained, use this method to make predictions.

        - Parameter record: A `Record` instance
     
        - Returns: `true` is the `Engine` estimates the user was working out.
     */
    func predictedWorkingOut(for record:Record) -> Bool {
        let predictedClass = classifier.predictClass(for: record)
        let workingOut = WorkingOut(rawValue: predictedClass)!

        return Bool(workingOut)
    }
}
