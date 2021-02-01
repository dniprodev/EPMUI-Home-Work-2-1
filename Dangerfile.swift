import Danger 
import DangerSwiftLint // package: https://github.com/ashfurrow/danger-swiftlint.git
import DangerSwiftCoverage

var danger = Danger()

SwiftLint.lint(inline: true)

Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"),
                            minimumCoverage: 50)
