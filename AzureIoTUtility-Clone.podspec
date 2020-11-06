# Podspec files (like this one) are Ruby code

Pod::Spec.new do |s|
  s.name             = 'AzureIoTUtility-Clone'
  s.version          = '1.3.10'
  s.summary          = 'AzureIoT C-Utility library for CocoaPods.'

  s.description      = <<-DESC
This is a CocoaPods release of the Azure C Shared Utility library,
which is part of the Microsoft Azure IoT C SDK.
                       DESC

  s.homepage         = 'https://github.com/Azure/azure-iot-sdk-c/blob/master/doc/sdk_cocoapods.md'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Microsoft' => '' }
  s.source           = { :git => 'https://github.com/ayershinn/azure-c-shared-utility.git', 
                          :tag => '1.3.10' } #, :branch => 'jbobotek-test-cocoa' }#, :tag => ENV['util_ver'] }

  s.ios.deployment_target = '9.0'

  # iOS does not ship with curl, so we'll use httpapi_compact.c as the default
  # If curl becomes important at some point, remove the adapters/httpapi_compact
  # entry from the s.source_files entry below and add:
  #     s.ios.source_files = 'adapters/httpapi_compact.c'
  #         and
  #     s.osx.source_files = 'adapters/httpapi_curl.c'
  s.source_files =
    'inc/**/*.h',
    'src/*.c',
    'pal/tlsio_options.c',
    'pal/agenttime.c',
    'pal/ios-osx/*.c',
    'adapters/lock_pthreads.c',
    'adapters/threadapi_pthreads.c',
    'adapters/linux_time.c',
    'adapters/tickcounter_linux.c',
    'adapters/uniqueid_linux.c',
    'adapters/httpapi_compact.c',
    'adapters/threadapi_pthreads.c'

  s.public_header_files = 'inc/**/*.h'#'inc/azure_c_shared_utility/*.h'

  # The header_mappings_dir is a location where the header files directory structure
  # is preserved.  If not provided the headers files are flattened.
  s.header_mappings_dir = 'inc/'

  # SWIFT_INCLUDE_PATHS tells Swift where to look for module.modulemap
  s.xcconfig = {
    # This is needed by all pods that depend on Protobuf:
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1",
    # This is needed by all pods that depend on gRPC-RxLibrary:
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    
    'USE_HEADERMAP' => 'NO',
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/AzureIoTUtility-Clone/inc"',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/AzureIoTUtility-Clone/inc/"',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }
  
  s.dependency 'AzureMacroUtils', '1.3.9'
  s.dependency 'AzureuMockC', '1.3.9'

end