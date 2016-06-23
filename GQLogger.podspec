
Pod::Spec.new do |s|
  s.name             = "GQLogger"
  s.version          = "0.0.1"
  s.summary          = "GQLogger For Lin_IT"
  s.description      = "Data persistent storage layer"
  s.license          = "Copyright (c) 2016年 lgq. All rights reserved."
  s.author           = { "GuoQiang Lin" => "lin_it@outlook.com" }
  s.source           = { :git => "https://github.com/Lin-IT-Lion/GQLogger.git", :tag => "0.0.1" }
  s.homepage 	 	     = "http://www.linit.space"
  s.source_files     = 'GQLogger/**/*.{h,m}'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  #s.resources = ''
  s.platform     = :ios, "7.0"

  s.ios.dependency 'LumberjackLauncher'
  
end