Pod::Spec.new do |s|
s.name             = 'OpenSourceController'
s.version          = '3.2.0'
s.summary          = 'Display all the librarys licence used in your application. Enjoy !'
s.description      = 'Display a screen with all licence used in your apply can be painful to maintain. OpenSourceController was built to respond to this problem. OpenSourceController is a simple parser to display the licences which are used in your application.'
s.homepage         = 'https://github.com/floriangbh/OpenSourceController'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Florian Gabach' => 'florian.gabach@gmail.com' }
s.source           = { :git => 'https://github.com/floriangbh/OpenSourceController.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'Sources/**/*'
end
