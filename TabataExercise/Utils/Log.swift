//
//  Log.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 24.08.2023.
//

import Foundation
import os.log

struct Log {
    enum LogLevel: String {
        case error = "⛔️ ERROR"
        case warning = "⚠️ WARNING"
        case info = "✅ INFO"
        case debug = "🐛 DEBUG"
    }

    static func info(_ info: String, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        os_log("[%@: %@] %@ -> %@ -> %d", type: .default, level.rawValue, info, (file as NSString).lastPathComponent, function, line)
        #endif
    }

    static func debug(_ info: String, level: LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        os_log("[%@: %@] %@ -> %@ -> %d", type: .default, level.rawValue, info, (file as NSString).lastPathComponent, function, line)
        #endif
    }

    static func warning(_ info: String, level: LogLevel = .warning, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        os_log("[%@: %@] %@ -> %@ -> %d", type: .default, level.rawValue, info, (file as NSString).lastPathComponent, function, line)
        #endif
    }

    static func error(_ info: String, level: LogLevel = .error, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        os_log("[%@: %@] %@ -> %@ -> %d", type: .default, level.rawValue, info, (file as NSString).lastPathComponent, function, line)
        #endif
    }
}
