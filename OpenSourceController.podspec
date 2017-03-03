Pod::Spec.new do |s|
s.name             = 'OpenSourceController'
s.version          = '1.0.0'
s.summary          = 'Display all the librarys licence used in your application. Enjoy !'
s.description      = 'Display a screen with all licence used in your apply can be painful to maintain. OpenSourceController was built to respond to this problem. OpenSourceController is a simple parser to display the licences which are used in your application.'
s.homepage         = 'https://github.com/terflogag/OpenSourceController'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Florian Gabach' => 'contact@floriangabach.fr' }
s.source           = { :git => 'https://github.com/terflogag/OpenSourceController.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'OpenSourceController/Classes/**/*'
end
