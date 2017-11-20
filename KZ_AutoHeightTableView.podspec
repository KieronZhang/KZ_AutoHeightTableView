
Pod::Spec.new do |s|

    s.name = 'KZ_AutoHeightTableView'
    s.version = '0.1'
    s.summary = 'iOS Auto Height TableView.'
    s.homepage = 'https://github.com/KieronZhang/KZ_AutoHeightTableView'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang.' => 'https://github.com/KieronZhang'}
    s.platform = :ios, '8.0'
    s.source = {:git => 'https://github.com/KieronZhang/KZ_AutoHeightTableView.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.frameworks = 'UIKit', 'Foundation'
    s.vendored_frameworks = 'KZ_AutoHeightTableView/KZ_AutoHeightTableViewFramework.framework'
    s.requires_arc = true

    s.dependency 'KZ_Categories'

end
