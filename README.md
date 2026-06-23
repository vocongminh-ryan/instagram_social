# Instagram Social

Flutter starter project structured with Clean Architecture and `flutter_bloc` (Cubit).

## Structure

```
lib/
├── app/                         # App shell, theme, global providers
└── features/feed/
    ├── data/                    # Data sources, models, repository implementation
    ├── domain/                  # Entities, repository contracts, use cases
    └── presentation/            # Pages, widgets and Cubits
```

`FeedPage` renders state only. `FeedCubit` coordinates UI state and invokes the
`GetFeed` use case. The use case depends on the `FeedRepository` contract; the
data layer supplies its implementation. Replace `FeedLocalDataSource` with an
API or database source without changing presentation or domain code.

## Run

```bash
flutter pub get
flutter run
```
