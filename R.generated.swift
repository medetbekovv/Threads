//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var data: data { .init(bundle: bundle) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func data(bundle: Foundation.Bundle) -> data {
    .init(bundle: bundle)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.data` struct is generated, and contains static references to 2 datas.
  struct data {
    let bundle: Foundation.Bundle

    /// Data asset `SF-Pro-Display-Thin`.
    var sfProDisplayThin: RswiftResources.DataResource { .init(name: "SF-Pro-Display-Thin", path: [], bundle: bundle, onDemandResourceTags: nil) }

    /// Data asset `SFProDisplayMedium`.
    var sfProDisplayMedium: RswiftResources.DataResource { .init(name: "SFProDisplayMedium", path: [], bundle: bundle, onDemandResourceTags: nil) }
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `Black`.
    var black: RswiftResources.ColorResource { .init(name: "Black", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 24 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `BackIcon`.
    var backIcon: RswiftResources.ImageResource { .init(name: "BackIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `EditeProfilePhoto`.
    var editeProfilePhoto: RswiftResources.ImageResource { .init(name: "EditeProfilePhoto", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `StiveJobsImages`.
    var stiveJobsImages: RswiftResources.ImageResource { .init(name: "StiveJobsImages", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `Threads Logo`.
    var threadsLogo: RswiftResources.ImageResource { .init(name: "Threads Logo", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `activity`.
    var activity: RswiftResources.ImageResource { .init(name: "activity", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `appleIcon`.
    var appleIcon: RswiftResources.ImageResource { .init(name: "appleIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `comments`.
    var comments: RswiftResources.ImageResource { .init(name: "comments", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `exite`.
    var exite: RswiftResources.ImageResource { .init(name: "exite", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `eye`.
    var eye: RswiftResources.ImageResource { .init(name: "eye", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `eye-off`.
    var eyeOff: RswiftResources.ImageResource { .init(name: "eye-off", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `fa6-solid_user (1)`.
    var fa6Solid_user1: RswiftResources.ImageResource { .init(name: "fa6-solid_user (1)", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `googleIcon`.
    var googleIcon: RswiftResources.ImageResource { .init(name: "googleIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `home`.
    var home: RswiftResources.ImageResource { .init(name: "home", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `likeIcon`.
    var likeIcon: RswiftResources.ImageResource { .init(name: "likeIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `navigateBur`.
    var navigateBur: RswiftResources.ImageResource { .init(name: "navigateBur", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `profile`.
    var profile: RswiftResources.ImageResource { .init(name: "profile", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `profilePhoto`.
    var profilePhoto: RswiftResources.ImageResource { .init(name: "profilePhoto", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `removeDelete`.
    var removeDelete: RswiftResources.ImageResource { .init(name: "removeDelete", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `repost`.
    var repost: RswiftResources.ImageResource { .init(name: "repost", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `repostIcon`.
    var repostIcon: RswiftResources.ImageResource { .init(name: "repostIcon", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `search`.
    var search: RswiftResources.ImageResource { .init(name: "search", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `send`.
    var send: RswiftResources.ImageResource { .init(name: "send", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `setImage`.
    var setImage: RswiftResources.ImageResource { .init(name: "setImage", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `write`.
    var write: RswiftResources.ImageResource { .init(name: "write", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
            var uiSceneStoryboardFile: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneStoryboardFile") ?? "Main" }
          }
        }
      }
    }
  }

  /// This `_R.font` struct is generated, and contains static references to 18 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle

    /// Font `SFProDisplay-Black`.
    var sfProDisplayBlack: RswiftResources.FontResource { .init(name: "SFProDisplay-Black", bundle: bundle, filename: "SF-Pro-Display-Black.otf") }

    /// Font `SFProDisplay-BlackItalic`.
    var sfProDisplayBlackItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-BlackItalic", bundle: bundle, filename: "SF-Pro-Display-BlackItalic.otf") }

    /// Font `SFProDisplay-Bold`.
    var sfProDisplayBold: RswiftResources.FontResource { .init(name: "SFProDisplay-Bold", bundle: bundle, filename: "SF-Pro-Display-Bold.otf") }

    /// Font `SFProDisplay-BoldItalic`.
    var sfProDisplayBoldItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-BoldItalic", bundle: bundle, filename: "SF-Pro-Display-BoldItalic.otf") }

    /// Font `SFProDisplay-Heavy`.
    var sfProDisplayHeavy: RswiftResources.FontResource { .init(name: "SFProDisplay-Heavy", bundle: bundle, filename: "SF-Pro-Display-Heavy.otf") }

    /// Font `SFProDisplay-HeavyItalic`.
    var sfProDisplayHeavyItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-HeavyItalic", bundle: bundle, filename: "SF-Pro-Display-HeavyItalic.otf") }

    /// Font `SFProDisplay-Italic`.
    var sfProDisplayItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-Italic", bundle: bundle, filename: "SF-Pro-Display-RegularItalic.otf") }

    /// Font `SFProDisplay-Light`.
    var sfProDisplayLight: RswiftResources.FontResource { .init(name: "SFProDisplay-Light", bundle: bundle, filename: "SF-Pro-Display-Light.otf") }

    /// Font `SFProDisplay-LightItalic`.
    var sfProDisplayLightItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-LightItalic", bundle: bundle, filename: "SF-Pro-Display-LightItalic.otf") }

    /// Font `SFProDisplay-Medium`.
    var sfProDisplayMedium: RswiftResources.FontResource { .init(name: "SFProDisplay-Medium", bundle: bundle, filename: "SF-Pro-Display-Medium.otf") }

    /// Font `SFProDisplay-MediumItalic`.
    var sfProDisplayMediumItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-MediumItalic", bundle: bundle, filename: "SF-Pro-Display-MediumItalic.otf") }

    /// Font `SFProDisplay-Regular`.
    var sfProDisplayRegular: RswiftResources.FontResource { .init(name: "SFProDisplay-Regular", bundle: bundle, filename: "SF-Pro-Display-Regular.otf") }

    /// Font `SFProDisplay-Semibold`.
    var sfProDisplaySemibold: RswiftResources.FontResource { .init(name: "SFProDisplay-Semibold", bundle: bundle, filename: "SF-Pro-Display-Semibold.otf") }

    /// Font `SFProDisplay-SemiboldItalic`.
    var sfProDisplaySemiboldItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-SemiboldItalic", bundle: bundle, filename: "SF-Pro-Display-SemiboldItalic.otf") }

    /// Font `SFProDisplay-Thin`.
    var sfProDisplayThin: RswiftResources.FontResource { .init(name: "SFProDisplay-Thin", bundle: bundle, filename: "SF-Pro-Display-Thin.otf") }

    /// Font `SFProDisplay-ThinItalic`.
    var sfProDisplayThinItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-ThinItalic", bundle: bundle, filename: "SF-Pro-Display-ThinItalic.otf") }

    /// Font `SFProDisplay-Ultralight`.
    var sfProDisplayUltralight: RswiftResources.FontResource { .init(name: "SFProDisplay-Ultralight", bundle: bundle, filename: "SF-Pro-Display-Ultralight.otf") }

    /// Font `SFProDisplay-UltralightItalic`.
    var sfProDisplayUltralightItalic: RswiftResources.FontResource { .init(name: "SFProDisplay-UltralightItalic", bundle: bundle, filename: "SF-Pro-Display-UltralightItalic.otf") }

    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [sfProDisplayBlack, sfProDisplayBlackItalic, sfProDisplayBold, sfProDisplayBoldItalic, sfProDisplayHeavy, sfProDisplayHeavyItalic, sfProDisplayItalic, sfProDisplayLight, sfProDisplayLightItalic, sfProDisplayMedium, sfProDisplayMediumItalic, sfProDisplayRegular, sfProDisplaySemibold, sfProDisplaySemiboldItalic, sfProDisplayThin, sfProDisplayThinItalic, sfProDisplayUltralight, sfProDisplayUltralightItalic].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 20 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `COPYRIGHT.txt`.
    var copyrightTxt: RswiftResources.FileResource { .init(name: "COPYRIGHT", pathExtension: "txt", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Black.otf`.
    var sfProDisplayBlackOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Black", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-BlackItalic.otf`.
    var sfProDisplayBlackItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-BlackItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Bold.otf`.
    var sfProDisplayBoldOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Bold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-BoldItalic.otf`.
    var sfProDisplayBoldItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-BoldItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Heavy.otf`.
    var sfProDisplayHeavyOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Heavy", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-HeavyItalic.otf`.
    var sfProDisplayHeavyItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-HeavyItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Light.otf`.
    var sfProDisplayLightOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Light", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-LightItalic.otf`.
    var sfProDisplayLightItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-LightItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Medium.otf`.
    var sfProDisplayMediumOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Medium", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-MediumItalic.otf`.
    var sfProDisplayMediumItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-MediumItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Regular.otf`.
    var sfProDisplayRegularOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Regular", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-RegularItalic.otf`.
    var sfProDisplayRegularItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-RegularItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Semibold.otf`.
    var sfProDisplaySemiboldOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Semibold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-SemiboldItalic.otf`.
    var sfProDisplaySemiboldItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-SemiboldItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Thin.otf`.
    var sfProDisplayThinOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Thin", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-ThinItalic.otf`.
    var sfProDisplayThinItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-ThinItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-Ultralight.otf`.
    var sfProDisplayUltralightOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-Ultralight", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SF-Pro-Display-UltralightItalic.otf`.
    var sfProDisplayUltralightItalicOtf: RswiftResources.FileResource { .init(name: "SF-Pro-Display-UltralightItalic", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFPro_Font_License.rtf`.
    var sfPro_Font_LicenseRtf: RswiftResources.FileResource { .init(name: "SFPro_Font_License", pathExtension: "rtf", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var main: main { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func main(bundle: Foundation.Bundle) -> main {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
      try self.main.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Main`.
    struct main: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = ViewController

      let bundle: Foundation.Bundle

      let name = "Main"
      func validate() throws {

      }
    }
  }
}