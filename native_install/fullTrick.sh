#find . -type f ! -name 'fullTrick.sh' -delete

rm -rf ./*

git clone https://github.com/apple/swift

swift/utils/update-checkout --clone --tag swift-3.1-DEVELOPMENT-SNAPSHOT-2017-03-05-a

sudo nice --20 swift/utils/build-script --preset=prepass

sudo nice --20 swift/utils/build-script --preset=postpass
