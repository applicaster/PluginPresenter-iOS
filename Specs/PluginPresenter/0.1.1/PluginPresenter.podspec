Pod::Spec.new do |s|
s.name             = "PluginPresenter"
s.version          = '0.1.1'
s.summary          = "PluginPresenter"
s.description      = <<-DESC
Protocol to allow to present an Applicaster plugin and wait for a response in that plugin.
DESC
s.homepage         = "https://github.com/applicaster/PluginPresenter-iOS"
s.license          = 'CMPS'
s.author           = "Applicaster LTD."
s.source           = { :git => "git@github.com:applicaster/PluginPresenter-iOS.git", :tag => s.version.to_s }
s.platform         = :ios, '10.0'
s.requires_arc 	   = true
s.static_framework = false

s.source_files     = 'PluginPresenterProtocol.swift'

s.xcconfig         =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'ENABLE_BITCODE' => 'YES',
    'OTHER_CFLAGS'  => '-fembed-bitcode'
}

end
