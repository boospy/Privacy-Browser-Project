# Chromium JSON Options + Privacy

**You would like to show your appreciation for our help 8-o. Gladly. We thank you for your donation! ;)**

<a href="https://www.paypal.com/donate/?hosted_button_id=JTFYJYVH37MNE">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif">
</a>

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/L3L813B3CV)

With json options, a Google Chrome-based web browser can be easily configured globally on a Linux system. This allows you to enforce settings in all areas for all users of a Linux desktop/terminal server. This has the advantage that you don't have to worry about the user settings of each individual and that company-wide policies can be easily applied. In addition, you can have each extension installed automatically.

## Modification of privacy.json
Since Google and now unfortunately also Firefox are becoming more and more intrusive when it comes to advertising and skimming personal data, I thought I would disable some unnecessary (-> unwanted) features. 

## Which Chrome-based web browser should be used?
There are some quite good derivatives, such as [Brave browser](https://brave.com/) or [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium). Chromium itself comes from Google and is therefore best maintained. Brave and ungoogled-chromium are also well-maintained projects for many years. Brave also randomizes the [Canvan fingerprint](https://en.wikipedia.org/wiki/Canvas_fingerprinting). It's up to you which one you use. It was tested with Brave and Chromium.

### Chromium installation for Ubuntu 24.04 LTS
The following script uninstalls the snap (if it is installed), gives the new package source the higher priority and installs Chromium as a Deb package. Many thanks to https://freeshell.de, who maintain the Chromium DEB package. 
~~~
wget XXX/deb-chromium.sh
chmod +x deb-chromium.sh
./deb-chromium.sh
~~~
### Chromium installation for Debian Bookworm and Proxmox 8.x
Chromium can be installed from the existing package sources under Debian Bookworm and Proxmox 8.x

~~~
apt install chromium
~~~

### Brave installation on Ubuntu 24.04 LTS, Debian Bookworm and Proxmox 8.x
~~~
apt install curl

curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list

apt update

apt install brave-browser
~~~
Source: https://brave.com/linux/


## JSON options
To install the options, they must be placed in the correct location. For Chromium, this is “/etc/chromium/policies/managed/”. If it does not yet exist, they must be created with root privileges:
~~~
mkdir -p /etc/chromium/policies/managed
~~~
Or for using Brave-Browser (DEB-installation):
~~~
mkdir -p /etc/brave/policies/managed
~~~

### Details of general.json
The config has nothing to do with privacy and is only used for global options that you may want to set.
This table provides an overview of the configured [Google Chrome policies](https://chromeenterprise.google/policies/) and their explanations.

| Option                     | Explanation                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `HomepageLocation`         | Sets the homepage of Chromium.                                                  |
| `RestoreOnStartup`         | Defines what is loaded when Chromium starts (e.g., restore the previous session). |
| `RestoreOnStartupURLs`     | Contains a list of URLs that open when Chromium starts.                           |
| `ShowHomeButton`           | Enables or disables the home button in the toolbar.                             |
| `BookmarkBarEnabled`       | Enables or disables the bookmarks bar.                                          |
| `BrowserLabsEnabled`       | Enables or disables experimental BrowserLabs features.                          |

### Details of privacy.json

| Option                                          | Explanation           |
|-------------------------------------------------|-----------------------|
| `BrowserSignin`                                 | Controls whether users can sign in to Chrome (0 = disabled). |
| `SyncDisabled`                                  | Enables or disables Chrome Sync. |
| `SpellcheckEnabled`                             | Enables or disables spell check. |
| `SafeBrowsingEnabled`                           | Enables or disables Google Safe Browsing. |
| `TranslateEnabled`                              | Enables or disables automatic webpage translation. |
| `AutofillAddressEnabled`                        | Enables or disables autofill for addresses. |
| `AutofillCreditCardEnabled`                     | Enables or disables autofill for credit cards. |
| `AutofillProfileEnabled`                        | Enables or disables profile-based autofill. |
| `AlternateErrorPagesEnabled`                    | Enables or disables alternative error pages. |
| `SearchSuggestEnabled`                          | Enables or disables search suggestions. |
| `BlockThirdPartyCookies`                        | Blocks or allows third-party cookies. |
| `DefaultThirdPartyStoragePartitioningSetting`   | Controls third-party storage partitioning (2 = strict mode). |
| `CloudPrintProxyEnabled`                        | Enables or disables Google Cloud Print. |
| `ScreenCaptureAllowed`                          | Allows or prevents screen capture. |
| `LiveTranslateEnabled`                          | Enables or disables live translation. |
| `RemoteAccessHostAllowRemoteAccessConnections`  | Allows or blocks remote access connections. |
| `RemoteAccessHostAllowRemoteSupportConnections` | Allows or blocks remote support connections. |
| `DisableScreenshots`                            | Prevents users from taking screenshots. |
| `FeedbackSurveysEnabled`                        | Enables or disables feedback surveys. |
| `DomainReliabilityEnabled`                      | Enables or disables domain reliability monitoring. |
| `DomainReliabilityAllowed`                      | Controls whether domain reliability is allowed. |
| `PrivacySandboxEnabled`                         | Enables or disables the Privacy Sandbox. |
| `BackgroundModeEnabled`                         | Enables or disables Chrome background processes. |
| `NetworkTimeQueriesEnabled`                     | Enables or disables network time synchronization queries. |
| `DefaultAppsEnabled`                            | Enables or disables the installation of default Chrome apps. |
| `UrlKeyedAnonymizedDataCollectionEnabled`       | Controls whether anonymized URL-keyed data collection is allowed. |
| `NetworkPredictionOptions`                      | Controls network prediction settings, Websites are preloaded based on surfing behavior. (2 = disabled). |
| `MetricsReportingEnabled`                       | Enables or disables Chrome usage and crash reporting. |
| `PaymentMethodQueryEnabled`                     | Websites allow you to check whether a user has saved payment methods.                      |
| `EnableMediaRouter`                             | Enables or disables the Chrome Media Router. |


### Details of forced-extensions.json
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


Other example extensions that you can add/replace with the ID:

| Extension ID                                | Name                                      |
|---------------------------------------------|-------------------------------------------|
| `lmjnegcaeklhafolokijcfjliaokphfk`         | [Video DownloadHelper](https://chromewebstore.google.com/detail/video-downloadhelper/lmjnegcaeklhafolokijcfjliaokphfk)                      |
| `fnaicdffflnofjppbagibeoednhnbjhg`         | [floccus bookmarks sync](https://chromewebstore.google.com/detail/floccus-bookmarks-sync/fnaicdffflnofjppbagibeoednhnbjhg)                    |
| `cofdbpoegempjloogbagkncekinflcnj`         | [DeepL: KI-translator and writing assistant](https://chromewebstore.google.com/detail/deepl-ki-%C3%BCbersetzer-und-s/cofdbpoegempjloogbagkncekinflcnj) |
| `eimadpbcbfnmbkopoojfekhnkhdbieeh`         | [Dark Reader](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)                               |


### Deploy the options

~~~
mkdir -p /etc/chromium/policies/managed
wget XXX/force-extensions.json
wget XXX/general.json
~~~

Or alternatively, all of the above extensions managed:
~~~
wget XXX/force-extensions-ALL.json
~~~

Options can always be manually adjusted. After saving the changes, Chromium does not have to be closed. Changes are applied immediately. If there are syntax errors, all options are immediately disabled. You will see this immediately in the Chromium settings ;)