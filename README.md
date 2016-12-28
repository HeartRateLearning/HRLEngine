# HRLEngine

[![CI Status](http://img.shields.io/travis/HeartRateLearning/HRLEngine.svg?style=flat)](https://travis-ci.org/HeartRateLearning/HRLEngine)
[![codecov.io](https://codecov.io/github/HeartRateLearning/HRLEngine/coverage.svg?branch=master)](https://codecov.io/github/HeartRateLearning/HRLEngine?branch=master)
[![Version](https://img.shields.io/cocoapods/v/HRLEngine.svg?style=flat)](http://cocoapods.org/pods/HRLEngine)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/HRLEngine.svg)](http://cocoadocs.org/docsets/HRLEngine)

Use Machine Learning to predict if a person is working out based of his/her heart rate.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

HRLEngine is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HRLEngine"
```

## Usage

```swift
let date = Date()

let dataFrame = DataFrame()
dataFrame.append(record: Record(date:date.addingTimeInterval(-6 * 60 * 60),
                                bpm:Float(100)),
                 isWorkingOut: false)
dataFrame.append(record: Record(date:date.addingTimeInterval(-5 * 60 * 60),
                                bpm:Float(140)),
                 isWorkingOut: true)
dataFrame.append(record: Record(date:date.addingTimeInterval(-4 * 60 * 60),
                                bpm:Float(120)),
                 isWorkingOut: true)
dataFrame.append(record: Record(date:date.addingTimeInterval(-3 * 60 * 60),
                                bpm:Float(70)),
                 isWorkingOut: false)
dataFrame.append(record: Record(date:date.addingTimeInterval(-2 * 60 * 60),
                                bpm:Float(55)),
                 isWorkingOut: false)
dataFrame.append(record: Record(date:date.addingTimeInterval(-1 * 60 * 60),
                                bpm:Float(125)),
                 isWorkingOut: true)

let engine = Engine()
engine.train(with: dataFrame)

let predictDate = date.addingTimeInterval(-3.5 * 60 * 60)
let predictBPM = Float(130)
let isWorkingOut = engine.predictedWorkingOut(for: Record(date:predictDate,
                                                          bpm:predictBPM))

print("At \(predictDate) with \(predictBPM) bpm, is user working out? \(isWorkingOut)")
```

## License

HRLEngine is available under the MIT license. See the LICENSE file for more info.
