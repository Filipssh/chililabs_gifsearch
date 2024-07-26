# chililabs_gifsearch

A gif search application using the Giphy service

```
Flutter 3.22.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 761747bfc5 (7 weeks ago) • 2024-06-05 22:15:13 +0200
Engine • revision edd8546116
Tools • Dart 3.4.3 • DevTools 2.34.3
```
# Setting up:
Create a `.env` file on project root with the contents:
<pre><code>GIPHY_API_KEY=<i>_your_api_key_</i></code></pre>

# Primary Requirements:
## Technical
- [x] Primary platforms - iOS & Android;
- [x] Auto search - requests to retrieve Gif information from the service are made automatically with a small delay after user stops typing;
- [x] Pagination - loading more results when scrolling;
- [x] Vertical & horizontal orientation support;
- [x] Error handling;
- [x] Unit tests - as much as you see fit;

## UI
- [x] Responsive & matching platform guidelines;
- [x] At least 2 views sourced by data from Giphy;
- [x] Results are displayed in a grid;
- [x] Clicking on a grid item should navigate to a detailed Gif view.
- [x] Loading indicators;
- [x] Error display;

## Bonus points:
- [x] Using state management approaches or libraries such as BLoC (flutter_bloc), Riverpod or others;
  - All state management between pages is done with the Provider package.
- [x] Using an understandable architecture pattern;
  - Trying to follow S.O.L.I.D. principles. I need more experience to understand if I've done it right.
- [x] Page navigation is separate from page widget code (a Coordinator pattern or similar);
  - (See lib\routes\routes.dart)
- [x] Network availability handling;

# Author's Notes:
- I tried adding an option to download images with flutter_downloader in the detailed gif view. Too many problems with getting permissions and making status notifications.
- There is only one unit test. It is to show how I _would_ approach testing, not that I believe that is a decent coverage.
