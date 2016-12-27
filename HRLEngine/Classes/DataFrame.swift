//
//  DataFrame.swift
//  Pods
//
//  Created by Enrique de la Torre (dev) on 26/12/2016.
//
//

import Foundation
import HRLAlgorithms

public class DataFrame: NSObject {
    fileprivate var records: [Record] = []
    fileprivate var classes: [UInt] = []

    func append(record: Record, isWorkingOut: Bool) {
        records.append(record)
        classes.append(WorkingOut(isWorkingOut).rawValue)
    }
}

extension DataFrame: HRLMatrixDataSource {
    public func rowCount() -> HRLSize {
        return HRLSize(records.count)
    }

    public func columnCount() -> HRLSize {
        guard let record = records.first else { return 0 }

        return record.count()
    }

    public func value(atRow row: HRLSize, column: HRLSize) -> HRLValue {
        let record = records[Int(row)]

        return record.value(at: column)
    }

    public func `class`(forRow row: HRLSize) -> UInt {
        return classes[Int(row)]
    }
}
