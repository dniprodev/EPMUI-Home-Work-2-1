import Danger 
import DangerSwiftLint // package: https://github.com/ashfurrow/danger-swiftlint.git

let danger = Danger()

SwiftLint.lint()

xcov.report(
  scheme: 'UpInterHomeWork21',
  project: 'UpInterHomeWork21.xcodeproj',
  xccov_file_direct_path: ENV['BITRISE_XCRESULT_PATH'],
  include_targets: 'UpInterHomeWork21.app'
)
