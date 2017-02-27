Pod::Spec.new do |s|
s.name             = 'OpenSourceController'
s.version          = '0.1.0'
s.summary          = 'Blablablabla blabbla blabbla blabbla'
s.description      = 'Blablablabla blabbla blabbla blabbla blabbla blabbla blabbla blabbla blabbla blabbla'
s.homepage         = 'https://github.com/terflogag/GBHFacebookImagePicker'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Florian Gabach' => 'contact@floriangabach.fr' }
s.source           = { :git => 'https://github.com/terflogag/GBHFacebookImagePicker.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'OpenSourceController/Classes/**/*'
s.resource_bundles = {
'OpenSourceController' => [
'Images/*.{png}','OpenSourceController/Classes/Storyboard/*.{storyboard,xib}'
]
}
end
