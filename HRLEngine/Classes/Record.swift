//
//  Record.swift
//  Pods
//
//  Created by Enrique de la Torre (dev) on 22/12/2016.
//
//

import Foundation
import HRLAlgorithms

public class Record: NSObject {
    fileprivate let values: [HRLValue]

    fileprivate static let calendar = gmtGregorianCalendar()

    init(date: Date, bpm: Float) {
        values = [
            HRLValue(Record.weekday(from: date)),
            HRLValue(Record.timeIntervalFromMidnight(to: date)),
            HRLValue(bpm)
        ]
    }
}

extension Record: HRLVector {
    public func count() -> HRLSize {
        return HRLSize(values.count)
    }

    public func value(at index: HRLSize) -> HRLValue {
        return values[Int(index)]
    }
}

private extension Record {
    enum Constants {
        static let TimeZoneGMT = "GMT"
    }

    static func gmtGregorianCalendar() -> Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(abbreviation: Constants.TimeZoneGMT)!

        return calendar
    }

    static func weekday(from date: Date) -> Int {
        return calendar.component(.weekday, from: date)
    }

    static func timeIntervalFromMidnight(to date: Date) -> TimeInterval {
        let midnight = startOfDay(for: date)

        return date.timeIntervalSince(midnight)
    }

    static func startOfDay(for date: Date) -> Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                 from: date)
        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
}
