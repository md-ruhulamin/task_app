# Developer Guide — Scaffolded App Structure ✅

This project now contains a minimal but opinionated scaffolding for building a Flutter app (screens, controllers, models, theme and constants).

Key folders added under `lib/`:

- `core/constants/` — app-wide constants (colors, routes, strings)
- `core/theme/` — `AppTheme` using the existing text styles
- `models/` — data models (e.g., `Task`)
- `data/` — mock data used for initial seeding
- `controllers/` — change notifier controllers (e.g., `TaskController`)
- `screens/` — UI screens (home, add task, task detail)
- `widgets/` — reusable widgets (`TaskCard`)
- `services/` — storage/persistence placeholders

Quick run steps:

1. Get packages:

```bash
flutter pub get
```

2. Run app (usual):

```bash
flutter run
```

Notes & next steps:
- Persistent storage (SharedPreferences/Hive) is left as a TODO in `services/storage_service.dart`.
- Linting and tests should be added next; the current files are minimal to keep the scaffold small.
- Feel free to swap Provider for Bloc/GetX/riverpod depending on preference.
