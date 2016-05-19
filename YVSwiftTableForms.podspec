#
# Be sure to run `pod lib lint YVSwiftTableForms.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "YVSwiftTableForms"
s.version          = "0.1.0"
s.summary          = "A Swift library to create Forms using UITableView."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
TODO: Its an Swift UITableView Form Library using that you can directly add rows and sections using its functions and create a form or any other UITableView related screen. YVSwiftTableForms make it easy to use UITableView in any of your application.
DESC

s.homepage         = "https://github.com/yashvyas29/YVSwiftTableForms"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = { :type => "GNU GPLv3", :file => 'LICENSE' }
s.author           = { "Yash Vyas" => "yash.vyas.29@gmail.com" }
s.source           = { :git => "https://github.com/yashvyas29/YVSwiftTableForms.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

s.source_files = 'YVSwiftTableForms/Classes/**/*'

# s.resource_bundles = {
#   'YVSwiftTableForms' => ['YVSwiftTableForms/Assets/*.png']
# }
s.resource_bundles = {
'YVSwiftTableForms' => ['YVSwiftTableForms/Resources/*.xib']
}

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
s.dependency 'TPKeyboardAvoiding'
end
