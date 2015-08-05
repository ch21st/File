#
# Be sure to run `pod lib lint File.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "File"
  s.version          = "0.1.0"
  s.summary          = "A short description of File."
  s.description      = <<-DESC
                       An optional longer description of File

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/File"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Softshag & Me" => "admin@softshag.dk" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/File.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.default_subspec = 'Core'


  s.resource_bundles = {
    'Restler' => ['Pod/Assets/*.png']
  }

  s.subspec 'Core' do |cs|
    cs.source_files = 'Pod/Classes/*'
  end

  s.subspec 'Bytes' do |cd|
     cd.source_files = 'Pod/Classes/Bytes/**/*'
     cd.dependency 'Bytes'
  end
  s.resource_bundles = {
    'File' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
