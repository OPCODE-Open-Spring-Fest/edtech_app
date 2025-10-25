# [Bug] UI Overflow in Parent Dashboard (Bottom Overflowed by 27 pixels)

**Description**

When running the app on smaller screen devices (e.g., 1200×540 resolution), the Parent Dashboard screen throws a `Bottom Overflowed by 27 pixels` error. This happens when the content exceeds the visible height and the layout is not scrollable or doesn't account for system UI/padding.

**Screenshot**

(Attach the screenshot here) — drag and drop when creating the GitHub issue.

**Steps to Reproduce**

1. Open the Parent Dashboard (`lib/features/parent/presentation/pages/parent_dashboard.dart`).
2. Run the app on a smaller device or emulator (e.g., Pixel 4a or 1200×540 resolution).
3. Observe the bottom part of the "Quick Overview" section — the error appears in the debug console: `Bottom Overflowed by 27 pixels`.

**Expected Behavior**

The UI should scroll smoothly without overflow errors, and all widgets should be visible. The layout should respect safe areas (system UI insets) on devices with varying screen sizes.

**Suggested Fix**

- Wrap the dashboard's main content in a scrollable widget (e.g., `SingleChildScrollView`) OR use sliver-based widgets such as `SliverList`/`SliverPadding` for content inside a `CustomScrollView`.
- Ensure `SafeArea` (or bottom padding using `MediaQuery.of(context).viewPadding.bottom`) is applied where necessary so system UI does not clip content.
- Alternatively, convert the content sections into slivers rather than nested non-sliver scrollables.

**Notes**

I applied a simple, low-risk fix in the repo to mitigate this: the `SliverToBoxAdapter` content has been wrapped in a `SafeArea` with added bottom padding to avoid bottom clipping on smaller screens. This prevents the overflow on many devices while keeping the sliver structure. If the content grows further or is dynamic, consider converting the sections into sliver children (e.g., `SliverList`) for better performance.

**Environment**

- Flutter SDK: see `flutter --version`
- Dart SDK: see `dart --version`
- Affected file: `lib/features/parent/presentation/pages/parent_dashboard.dart`

**Additional context**

Attach any logs or screenshots here.
