# Instagram Social

Instagram Social la mot Flutter project dang duoc build theo huong Clean Architecture ket hop BLoC.

Muc tieu cua architecture nay la tach ro UI, business logic, data source va app configuration de code de mo rong khi them Home, Reels, Profile, Auth, Feed, Search...

## Tech stack

- Flutter 3.44.3, quan ly bang FVM
- Dart SDK ^3.11.5
- flutter_bloc
- flutter_lints

## Folder structure

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── app_init/
│   │   └── app_init.dart
│   ├── router/
│   │   ├── router_app_cofig.dart
│   │   └── router_app_name.dart
│   └── theme/
├── common/
│   ├── constants/
│   ├── utils/
│   └── widgets/
├── config/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── home/
    │   ├── blocs/
    │   ├── widgets/
    │   └── home_screen.dart
    └── reels/
```

## Architecture

Project chia theo layer:

- `app/`: app shell va composition root. Day la noi setup app-level dependencies, init service, theme, router va widget root.
- `app/app_init/`: chua logic khoi tao truoc khi run app, vi du load env, init storage, init analytics, setup dependency injection.
- `app/router/`: quan ly route name va route config tap trung. `router_app_name.dart` dung cho route constants, `router_app_cofig.dart` dung cho route mapping/config.
- `app/theme/`: theme, color, typography va style chung cua app.
- `presentation/`: UI layer. Moi feature co screen, widget rieng va BLoC/Cubit de quan ly state.
- `domain/`: business layer. Chua entity, repository contract va usecase. Layer nay khong phu thuoc Flutter UI hay API implementation.
- `data/`: data layer. Chua model, repository implementation va service goi API/local storage/platform.
- `common/`: thanh phan dung chung nhu constants, helpers, extensions va shared widgets.
- `config/`: cau hinh app theo environment/flavor hoac cac config global khac.

## Dependency rule

Huong dependency nen di tu ngoai vao trong:

```text
presentation -> domain <- data
app -> presentation/domain/data
```

Quy uoc:

- UI khong goi truc tiep service/API.
- BLoC/Cubit trong `presentation` goi usecase tu `domain`.
- Usecase lam viec voi repository contract trong `domain/repositories`.
- Repository implementation trong `data/repositories` xu ly mapping, cache, error normalization va goi service.
- Service trong `data/services` chi phu trach API, local storage hoac platform call.
- `app` la noi lap ghep dependency va cau hinh root widget/router/theme.

## Feature convention

Khi them mot feature moi, uu tien tao theo pattern:

```text
presentation/<feature>/
├── blocs/
├── widgets/
└── <feature>_screen.dart

domain/
├── entities/
├── repositories/
└── usecases/

data/
├── models/
├── repositories/
└── services/
```

Vi du voi Home:

- `presentation/home/home_screen.dart`: render UI.
- `presentation/home/blocs/`: state va user actions cua Home.
- `presentation/home/widgets/`: widget con chi dung cho Home.
- `domain/entities/`: entity ma Home can hien thi.
- `domain/usecases/`: action nghiep vu cua Home.
- `domain/repositories/`: contract ma usecase phu thuoc.
- `data/repositories/`: implementation cua contract.
- `data/services/`: noi lay du lieu tu API/local.

## Naming

- Screen: `<feature>_screen.dart`
- BLoC/Cubit: `<feature>_bloc.dart`, `<feature>_state.dart`, `<feature>_event.dart` hoac `<feature>_cubit.dart`
- Usecase: dong tu + danh tu, vi du `get_home_feed.dart`
- Repository contract: `<feature>_repository.dart` trong `domain/repositories`
- Repository implementation: `<feature>_repository_impl.dart` trong `data/repositories`
- Service: `<feature>_service.dart` hoac `<feature>_remote_service.dart`

## Run project

```bash
flutter pub get
flutter run
```

Neu dung FVM:

```bash
fvm flutter pub get
fvm flutter run
```

## Quality checks

```bash
flutter analyze
flutter test
```

Hoac voi FVM:

```bash
fvm flutter analyze
fvm flutter test
```
