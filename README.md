# Privacy Browser Project (PBP)

**You would like to show your appreciation for our help 8-o. Gladly. We thank you for your donation! ;)**

<a href="https://www.paypal.com/donate/?hosted_button_id=JTFYJYVH37MNE">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif">
</a>

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/L3L813B3CV)

With json options, a Google Chrome-based web browser can be easily configured globally on a Linux system. This allows you to enforce settings in all areas for all users of a Linux desktop/terminal server. This has the advantage that you don't have to worry about the user settings of each individual and that company-wide policies can be easily applied. In addition, you can have each extension installed automatically.

**To make sure you know exactly what you are installing, I recommend you read the instructions before making any changes to your system!** 

## Content Overview

* [Modivation](#modivation)
* [Which Chrome-based web browser should be used?](#which-chrome-based-web-browser-should-be-used)
* [JSON options](#json-options)
  * [Details of general.json](#details-of-generaljson)
  * [Details of privacy.json](#details-of-privacyjson)
  * [Details of privacy-extra-brave.json](#details-of-privacy-extra-bravejson)
  * [Details of forced-extensions-chromium.json](#details-of-forced-extensions-chromiumjson)
  * [Details of forced-extensions-brave.json](#details-of-forced-extensions-bravejson)
  * [Other example extensions that you can add/replace with the ID](#other-example-extensions-that-you-can-addreplace-with-the-id)
  * [Details of allowed-cookies.json](#details-of-allowed-cookiesjson)
* [Installation](#installation) 
  * [Chromium installation with json-options for Ubuntu 24.04 LTS](#chromium-installation-with-json-options-for-ubuntu-2404-lts)
  * [Chromium installation with json-options for Debian Bookworm and Proxmox 8.x](#chromium-installation-with-json-options-for-debian-bookworm-and-proxmox-8x)
  * [Brave installation with json-options on Ubuntu 24.04 LTS, Debian Bookworm and Proxmox 8.x](#brave-installation-with-json-options-on-ubuntu-2404-lts-debian-bookworm-and-proxmox-8x)
* [Additional options for extensions](#additional-options-for-extensions) 
  * [bitwarden.json](#bitwardenjson)
  * [language-tool.json](#language-tooljson)


## Modivation
Since Google and now unfortunately also Firefox are becoming more and more intrusive when it comes to advertising and skimming personal data, I thought I would disable some unnecessary (-> unwanted) features and increase privacy. It also annoyed me that sometimes new features were tried out and switches in Chrome/Chromium were activated without asking. 

## Which Chrome-based web browser should be used?
There are some quite good derivatives, such as [Brave browser](https://brave.com/) or [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium). Chromium itself comes from Google and is therefore best maintained. Brave and ungoogled-chromium are also well-maintained projects for many years. Brave also randomizes the [Canvan fingerprint](https://en.wikipedia.org/wiki/Canvas_fingerprinting). It's up to you which one you use. It was tested with Brave and Chromium.


## JSON options
To install the options, they must be placed in the correct location. For Chromium, this is “/etc/chromium/policies/managed/”. If it does not yet exist, they must be created with root privileges:
You don't have to do that. The step is included in the installation. It is used here for documentation purposes only. Options can always be manually adjusted. After saving the changes, Chromium does not have to be closed. Changes are applied immediately. If there are syntax errors, all options are immediately disabled. You recognize this immediately in the Chromium settings ;)

~~~
mkdir -p /etc/chromium/policies/managed
~~~
Or for using Brave-Browser (DEB-installation):
~~~
mkdir -p /etc/brave/policies/managed
~~~

> 💡**Attention!** Each `forced-extensions-<browser>.json` also installs and activates the Browser Extensions “[NoScript](https://noscript.net/)”.

_...This browser extension allows JavaScript and other potentially harmful content to be executed only by trusted web sites of your choice (e.g. your online bank).
NoScript also provides the most powerful anti-XSS protection ever available in a browser.
NoScript's unique pre-emptive script blocking approach prevents exploitation of security vulnerabilities (known, such as Meltdown or Spectre, and even not known yet!) with no functionality loss: you can enable JavaScript and other dynamic capabilities for sites you trust with a simple click._

If you have not yet worked with it, I recommend that you read the documentation of NoScript.
- [Usage](https://noscript.net/usage/)
- [Support Forums](https://forums.informaction.com/index.php)
- [FAQ](https://noscript.net/faq/)

If you do not want to use NoScript (which I do not recommend), you can delete the line from the file or comment it out with `//` in front of it.

~~~
// "doojmbjmlfjjnbmnoijecmcbfeoakpjm", //NoScript
~~~


### Details of general.json
The config has nothing to do with privacy and is only used for global options that you may want to set.
This table provides an overview of the configured [Google Chrome policies](https://chromeenterprise.google/policies/) and their explanations.

| Option                     | Explanation                                                                      |
|----------------------------|----------------------------------------------------------------------------------|
| `HomepageLocation`         | Sets the homepage of Chromium.                                                   |
| `RestoreOnStartup`         | Defines what is loaded when Chromium starts (e.g., restore the previous session). |
| `RestoreOnStartupURLs`     | Contains a list of URLs that open when Chromium starts.                          |
| `ShowHomeButton`           | Enables or disables the home button in the toolbar.                              |
| `BookmarkBarEnabled`       | Enables or disables the bookmarks bar.                                           |
| `HomepageIsNewTabPage`     | Enables or disables the tabpage by clicking on the "home-button"                 |
| `BrowserLabsEnabled`       | Enables or disables experimental BrowserLabs features.                           |

### Details of privacy.json

| Option                                          | Explanation                                                                                             |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| `BrowserSignin`                                 | Controls whether users can sign in to Chrome (0 = disabled).                                            |
| `SyncDisabled`                                  | Enables or disables Chrome Sync.                                                                        |
| `SpellcheckEnabled`                             | Enables or disables spell check.                                                                        |
| `SafeBrowsingEnabled`                           | Enables or disables Google Safe Browsing.                                                               |
| `TranslateEnabled`                              | Enables or disables automatic webpage translation.                                                      |
| `AutofillAddressEnabled`                        | Enables or disables autofill for addresses.                                                             |
| `AutofillCreditCardEnabled`                     | Enables or disables autofill for credit cards.                                                          |
| `AutofillProfileEnabled`                        | Enables or disables profile-based autofill.                                                             |
| `AlternateErrorPagesEnabled`                    | Enables or disables alternative error pages.                                                            |
| `SearchSuggestEnabled`                          | Enables or disables search suggestions.                                                                 |
| `BlockThirdPartyCookies`                        | Blocks or allows third-party cookies.                                                                   |
| `DefaultThirdPartyStoragePartitioningSetting`   | Controls third-party storage partitioning (2 = strict mode).                                            |
| `CloudPrintProxyEnabled`                        | Enables or disables Google Cloud Print.                                                                 |
| `ScreenCaptureAllowed`                          | Allows or prevents screen capture.                                                                      |
| `LiveTranslateEnabled`                          | Enables or disables live translation.                                                                   |
| `RemoteAccessHostAllowRemoteAccessConnections`  | Allows or blocks remote access connections.                                                             |
| `RemoteAccessHostAllowRemoteSupportConnections` | Allows or blocks remote support connections.                                                            |
| `DisableScreenshots`                            | Prevents users from taking screenshots.                                                                 |
| `FeedbackSurveysEnabled`                        | Enables or disables feedback surveys.                                                                   |
| `DomainReliabilityEnabled`                      | Enables or disables domain reliability monitoring.                                                      |
| `DomainReliabilityAllowed`                      | Controls whether domain reliability is allowed.                                                         |
| `PrivacySandboxEnabled`                         | Enables or disables the Privacy Sandbox.                                                                |
| `BackgroundModeEnabled`                         | Enables or disables Chrome background processes.                                                        |
| `NetworkTimeQueriesEnabled`                     | Enables or disables network time synchronization queries.                                               |
| `DefaultAppsEnabled`                            | Enables or disables the installation of default Chrome apps.                                            |
| `UrlKeyedAnonymizedDataCollectionEnabled`       | Controls whether anonymized URL-keyed data collection is allowed.                                       |
| `NetworkPredictionOptions`                      | Controls network prediction settings, Websites are preloaded based on surfing behavior. (2 = disabled). |
| `MetricsReportingEnabled`                       | Enables or disables Chrome usage and crash reporting.                                                   |
| `DefaultCookiesSetting` (disabled)              | Configure the default behavior for cookies. [See docs for more information.](https://chromeenterprise.google/policies/#DefaultCookiesSetting)|
| `PaymentMethodQueryEnabled`                     | Websites allow you to check whether a user has saved payment methods.                                   |
| `EnableMediaRouter`                             | Enables or disables the Chrome Media Router (chromecast).                                               |

### Details of privacy-extra-brave.json
There are 3 extra options that are only available in Brave. The third option describes the whitelist for the Brave shield. 

| Extension ID                                | Name                                                         |
|---------------------------------------------|--------------------------------------------------------------|
| `BraveRewardsDisabled`         | Enables or disables Brave Rewards.                           |
| `BraveWalletDisabled`         | Enables or disables the Brave Wallet.                        |
| `BraveShieldsDisabledForUrls`         | Add URLs to the whitelist that Brave-Shield can fully trust. |

### Details of forced-extensions-chromium.json
This gives you the option of automatically installing extensions for Chromium. Here is the list of extensions that will be installed with this json file:


| Extension ID                                | Name                                                                                                                                                   |
|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ddkjiahejlhfcafbddmgiahcphecmpfh`         | [Ublock Origin Lite](https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh)                                     |
| `cimiefiiaegbelhefglklhhakcgmhkai`         | [Plasma Integration](https://chromewebstore.google.com/detail/plasma-integration/cimiefiiaegbelhefglklhhakcgmhkai)                                     |
| `oldceeleldhonbafppcapldpdifcinji`         | [LanguageTool](https://chromewebstore.google.com/detail/grammatik-und-rechtschrei/oldceeleldhonbafppcapldpdifcinji)                                    |
| `mlomiejdfkolichcflejclcbmpeaniij`         | [Ghostery Tracker & Ad Blocker, Privacy AdBlocker](https://chromewebstore.google.com/detail/ghostery-tracker-werbeblo/mlomiejdfkolichcflejclcbmpeaniij) |
| `doojmbjmlfjjnbmnoijecmcbfeoakpjm`         | [NoScript](https://chromewebstore.google.com/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm)                                                         |
| `nngceckbapebfimnlniiiahkandclblb`         | [Bitwarden Password-Manager](https://chromewebstore.google.com/detail/bitwarden-passwortmanager/nngceckbapebfimnlniiiahkandclblb)                      |
| `kplfenefaakjhjkklghidleljeocgdap`         | [Qwant - alternate Search-Engine](https://chromewebstore.google.com/detail/qwant-search-engine/kplfenefaakjhjkklghidleljeocgdap)                       |


### Details of forced-extensions-brave.json
This gives you the option of automatically installing extensions for Chromium. Here is the list of extensions that will be installed with this json file:


| Extension ID                                | Name                                                                                                                                                   |
|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| `cimiefiiaegbelhefglklhhakcgmhkai`         | [Plasma Integration](https://chromewebstore.google.com/detail/plasma-integration/cimiefiiaegbelhefglklhhakcgmhkai)                                     |
| `oldceeleldhonbafppcapldpdifcinji`         | [LanguageTool](https://chromewebstore.google.com/detail/grammatik-und-rechtschrei/oldceeleldhonbafppcapldpdifcinji)                                    |
| `doojmbjmlfjjnbmnoijecmcbfeoakpjm`         | [NoScript](https://chromewebstore.google.com/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm)                                                         |
| `nngceckbapebfimnlniiiahkandclblb`         | [Bitwarden Password-Manager](https://chromewebstore.google.com/detail/bitwarden-passwortmanager/nngceckbapebfimnlniiiahkandclblb)                      |


### Other example extensions that you can add/replace with the ID

| Extension ID                                | Name                                                                                                       |
|---------------------------------------------|------------------------------------------------------------------------------------------------------------|
| `lmjnegcaeklhafolokijcfjliaokphfk`         | [Video DownloadHelper](https://chromewebstore.google.com/detail/video-downloadhelper/lmjnegcaeklhafolokijcfjliaokphfk) |
| `fnaicdffflnofjppbagibeoednhnbjhg`         | [floccus bookmarks sync](https://chromewebstore.google.com/detail/floccus-bookmarks-sync/fnaicdffflnofjppbagibeoednhnbjhg) |
| `cofdbpoegempjloogbagkncekinflcnj`         | [DeepL: KI-translator and writing assistant](https://chromewebstore.google.com/detail/deepl-ki-%C3%BCbersetzer-und-s/cofdbpoegempjloogbagkncekinflcnj) |
| `eimadpbcbfnmbkopoojfekhnkhdbieeh`         | [Dark Reader](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)       |
| `dhdgffkkebhmkfjojejmpbldmpobfkfo`         | [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)     |

### Details of allowed-cookies.json
If the option `DefaultCookiesSetting` is set to "4" (Keep cookies for session duration), then it makes sense to enter websites that you trust and where you want to store cookies beyond the browser session here. However, with option “4” it is no longer possible to edit allowed websites directly in the browser settings ([brave://settings/content/siteData](brave://settings/content/siteData)). If you want to continue to do this, simply do not use the Json option `DefaultCookiesSetting`. This means that you can continue to edit the websites that are allowed to set cookies beyond the session in json and in the browser settings. 


## Installation

### Chromium installation with json-options for Ubuntu 24.04 LTS
The following script uninstalls the snap (if it is installed), gives the new package source the higher priority and installs Chromium as a Deb package. Many thanks to https://freeshell.de, who maintain the Chromium DEB package.

- uninstall snap
- install chromium from freeshell
- install a default set of json-options

Execute the commands as root.
~~~
wget https://git.osit.cc/public-projects/chromium-json-options/-/raw/main/install-chromium-deb.sh
chmod +x install-chromium-deb.sh
./install-chromium-deb.sh
~~~
### Chromium installation with json-options for Debian Bookworm and Proxmox 8.x
Chromium can be installed from the existing package sources under Debian Bookworm and Proxmox 8.x

Execute the commands as root.
~~~
apt install chromium
~~~
And install json-options:
~~~
mkdir -p /etc/chromium/policies/managed
wget -O /etc/chromium/policies/managed/privacy.json https://git.osit.cc/public-projects/pbp/-/raw/main/privacy.json
wget -O /etc/chromium/policies/managed/allowed-cookies.json https://git.osit.cc/public-projects/pbp/-/raw/main/allowed-cookies.json
wget -O /etc/chromium/policies/managed/forced-extensions-brave.json https://git.osit.cc/public-projects/pbp/-/raw/main/forced-extensions-chromium.json
wget -O /etc/chromium/policies/managed/general.json https://git.osit.cc/public-projects/pbp/-/raw/main/general.json
~~~

### Brave installation with json-options on Ubuntu 24.04 LTS, Debian Bookworm and Proxmox 8.x

What the script do:

- install Brave-Browser from [the brave repository](https://brave.com/download/)
- install a default set of json-options with [extra privacy options for brave](#details-of-privacy-extra-bravejson)

Execute the commands as root.
~~~
wget https://git.osit.cc/public-projects/chromium-json-options/-/raw/main/install-brave-deb.sh
chmod +x install-brave-deb.sh
./install-brave-deb.sh
~~~

## Additional options for extensions

### bitwarden.json
If you run your own Bitwarden/[Vaultwarden server](https://github.com/dani-garcia/vaultwarden), you can use it to set the FQDN/IP of your server in the extension.

For Chromium:
~~~
wget -O /etc/chromium/policies/managed/bitwarden.json https://git.osit.cc/public-projects/pbp/-/raw/main/extensions_settings/bitwarden.json
~~~

For Brave:
~~~
wget -O /etc/brave/policies/managed/bitwarden.json https://git.osit.cc/public-projects/pbp/-/raw/main/extensions_settings/bitwarden.json
~~~


### language-tool.json
If you run [your own Language-Tool](https://github.com/Erikvl87/docker-languagetool) server, you can use it to set the FQDN/IP of your server in the extension.

For Chromium:
~~~
wget -O /etc/chromium/policies/managed/language-tool.json https://git.osit.cc/public-projects/pbp/-/raw/main/extensions_settings/language-tool.json
~~~

For Brave:
~~~
wget -O /etc/brave/policies/managed/language-tool.json https://git.osit.cc/public-projects/pbp/-/raw/main/extensions_settings/language-tool.json
~~~
