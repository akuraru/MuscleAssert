
Pod::Spec.new do |s|
  s.name         = "MuscleAssert"
  s.version      = "1.0.0"
  s.summary      = "A unit test framework for Swift using computation expressions."
  s.homepage     = "https://github.com/akuraru/MuscleAssert"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "akuraru" => "akuraru@gmail.com" }
  s.source       = {
    :git => "https://github.com/akuraru/MuscleAssert.git",
    :tag => s.version.to_s
  }

  s.default_subspec = 'All'

  s.subspec 'All' do |ss|
    ss.dependency 'MuscleAssert/Core'
  end
  s.subspec 'Core' do |ss|
    ss.source_files = 'MuscleAssert/**/*.{swift}'
    ss.requires_arc = true
  end
end
