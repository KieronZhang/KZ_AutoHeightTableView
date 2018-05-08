
Pod::Spec.new do |s|

    s.name = 'KZ_AutoHeightTableView'
    s.version = '0.1.1'
    s.summary = 'iOS Auto Height TableView.'
    s.homepage = 'https://github.com/KieronZhang/KZ_AutoHeightTableView'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_AutoHeightTableView.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true

    s.ios.frameworks = 'Foundation', 'UIKit'

    s.ios.deployment_target = '8.0'

    s.ios.vendored_frameworks = 'KZ_AutoHeightTableView/KZ_AutoHeightTableView_iOS.framework'

    s.dependency 'KZ_Categories'

end
