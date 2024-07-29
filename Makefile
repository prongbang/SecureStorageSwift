# make podspec_create
podspec_create:
	pod spec create SecureStorageSwift

# make podspec_lint
podspec_lint:
	pod spec lint SecureStorageSwift.podspec --verbose --allow-warnings

# make podspec_register email=dev.prongbang@gmail.com name=prongbang
podspec_register:
	pod trunk register $(email) '$(name)' --description='Work Macbook Pro'

# make podspec_push
podspec_push:
	pod trunk push SecureStorageSwift.podspec --allow-warnings