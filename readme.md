# Ionic Preview

An iOS app that auto-discovers your ionic live preview server on your LAN and
loads it into a `UIWebView` that will auto-update just like your browser.

##Usage
Run `ionic serve -b` in your terminal to start the autoreload service

Make sure that your phone is connected to WiFi

Open `IonicPreview.xcodeproj` in XCode, select your device, and hit the run
button

It will automatically scan to find your livereload server (takes 5 - 20 seconds)

