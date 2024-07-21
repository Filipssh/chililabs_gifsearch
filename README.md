# chililabs_gifsearch

A gif search application using the Giphy service

```
Flutter 3.22.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 761747bfc5 (7 weeks ago) • 2024-06-05 22:15:13 +0200
Engine • revision edd8546116
Tools • Dart 3.4.3 • DevTools 2.34.3
```


# Primary Requirements:
## Technical
- [x] Primary platforms - iOS & Android;
- [x] Auto search - requests to retrieve Gif information from the service are made automatically with a small delay after user stops typing;
- [x] Pagination - loading more results when scrolling;
- [x] Vertical & horizontal orientation support;
- [x] Error handling;
- [ ] Unit tests - as much as you see fit;

## UI
- [ ] Responsive & matching platform guidelines;
- [x] At least 2 views sourced by data from Giphy;
- [x] Results are displayed in a grid;
- [ ] Clicking on a grid item should navigate to a detailed Gif view.
- [x] Loading indicators;
- [x] Error display;

## Bonus points:
- [ ] Using state management approaches or libraries such as BLoC (flutter_bloc), Riverpod or others;
- [x] Using an understandable architecture pattern;
- [ ] Page navigation is separate from page widget code (a Coordinator pattern or similar);
- [ ] Network availability handling;

# Notes:
- [ ] No time limit. Quality > Speed;
- [ ] Documentation (https://developers.giphy.com/docs/api/)
- [ ] UI up to interpretation - only things mentioned in requirements are mandatory;
- [x] Flutter version MUST be noted in repository ReadMe file;
- [ ] If you were not able to complete some of the requirements, please note down what you tried and what was the result;
