ok: install genL10n build_runner

update: install genL10n

release_android: build_release_android upload_symbols_android

release_ios: build_release_ios upload_symbols_ios

build_runner:
	@echo "╠ generating files using Dart code"
	@flutter pub run build_runner build --delete-conflicting-outputs

lint:
	@echo "╠ Running Flutter analyze"
	@dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)

format:
	@echo "╠ Formatting the code"
	@dart format lib

outdate:
	@echo "╠ Running Flutter pub outdated"
	@flutter pub outdated

doctor:
	@echo "╠ checking if all its ok"
	@flutter doctor --verbose

clean:
	@echo "╠ Running Flutter clean"
	@flutter clean
	@flutter packages pub get

repair:
	@echo "╠ Running Flutter cache repair"
	@flutter pub cache repair

genL10n:
	@echo "╠ Running Flutter gen-l10n"
	@flutter gen-l10n

test:
	@echo "╠ Running Flutter test"
	@flutter test

analyze:
	@echo "╠ Running Flutter analyze"
	@flutter analyze

lint_fix_apply:
	@echo "╠ Running Flutter dart fix"
	@dart fix --apply

lint_dry:
	@echo "╠ Running dart dry fix"
	@dart fix --dry-run

install:
	@echo "╠ Running Flutter install flutter dependencies"
	@flutter pub get

goldenTests:
	@echo "╠ Running Flutter golden test"
	@flutter test --update-goldens --tags=golden

build_debug_android:
	@echo "╠ Running Flutter build debug android"
	@flutter run --debug

build_release_android:
	@echo "╠ Running Flutter build release android"
	@flutter build apk --obfuscate --release --split-debug-info=./build/app/symbols/android

upload_symbols_android:
	@echo "╠ Running Flutter upload symbols android"
	@firebase crashlytics:symbols:upload --app=1:801823438569:android:5cdfa8b53be2a15d86a278 ./build/app/symbols/android

build_release_ios:
	@echo "╠ Running Flutter build release ios"
	@flutter build ipa --release --obfuscate --split-debug-info=./build/app/symbols/ios

upload_symbols_ios:
	@echo "╠ Running Flutter upload symbols ios"
	@firebase crashlytics:symbols:upload --app=1:801823438569:ios:653843fde64dd4d186a278 ./build/app/symbols/ios

testWithCoverage:
	@echo "╠ Running Flutter test with coverage"
	@flutter test --coverage
	@echo "╠ Generate HTML report Note: on macOS you need to have lco installed on your system (`brew install lcov`) to use this: "
	@genhtml coverage/lcov.info -o coverage/html
	@echo "╠ Open the report"
	@open coverage/html/index.html

test: testWithCoverage
