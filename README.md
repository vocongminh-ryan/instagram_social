# Instagram Social

Flutter starter project structured as MVVM with Repository and Service layers.

## Structure

```
lib/
├── app/                         # App shell, theme and global providers
└── features/feed/
    ├── data/
    │   ├── models/              # API/data models
    │   ├── repositories/        # Cache, error handling and data orchestration
    │   └── services/            # API/platform calls only
    └── presentation/
        ├── view_models/         # UI state and user-action commands
        └── views/               # Widgets that render ViewModel state
```

Data flows in one direction: `FeedPage` (View) → `FeedViewModel` →
`FeedRepository` → `FeedApiService` → external API. State flows back from the
ViewModel to the View. The view has no API or data-processing logic; the
service has no caching or UI logic.

`FeedApiService` currently supplies a delayed in-memory response so the app can
run offline. Replace its `getPosts` body with HTTP/platform calls without
changing the View or ViewModel. `FeedRepository` is the suitable place for
response mapping, caching and error normalization.

## Run

```bash
flutter pub get
flutter run
```
