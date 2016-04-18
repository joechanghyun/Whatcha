# Whatcha
swift2 Chatting App Study

Using open sources

* **Chatto** - Chatto is a Swift lightweight framework to build chat applications. It's been designed to be extensible and performant. Along with Chatto there is ChattoAdditions, a companion framework which includes cells for messages and an extensible input component. You can find more details about how it was implemented in our blog. See them in action!

## Study 진행상황 
Open source 를 이용하여 swift 공부를 시작 Iphone 6 size 로 개발을 진행 중입니다.

## How to install
### CocoaPods
1. Make sure `use_frameworks!` is added to your `Podfile`.

2. Clone, add as a submodule or [download.](https://github.com/badoo/Chatto/archive/master.zip)

3. Include the following in your `Podfile`:
    ```
    pod 'Chatto', :path => '~/your chatto directory path'
    pod 'ChattoAdditions', :path => '~/your chatto directory path'
    ```
If you like to live on the bleeding edge, you can use the `master` branch with:
    ```
    pod 'Chatto', :git => 'https://github.com/badoo/Chatto'
	pod 'ChattoAdditions', :git => 'https://github.com/badoo/Chatto'
    ```
4. Run `pod install`
