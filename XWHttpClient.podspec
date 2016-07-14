Pod::Spec.new do |s|

  s.name         = "XWHttpClient"
  s.version      = "1.0.0"
  s.summary      = "简单封装AFNetworking 3.1.0的网络请求、下载功能！整合了在请求时转菊花提示"
  s.homepage     = "https://github.com/LightningTiger/XWHttpClient"
  s.license      = "MIT"
  s.author             = { "wzl" => "1585519210@qq.com" }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/LightningTiger/XWHttpClient.git", :tag => "#{s.version}" }
  s.source_files  = "XWHttpClient", "XWHttpClient/**/*.{h,m,mm}"
 
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  s.dependency "AFNetworking", "~> 3.1.0"
  s.dependency "MMProgressHUD", "~> 0.3.2"

end
