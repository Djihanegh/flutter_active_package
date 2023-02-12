# active_package

A Flutter plugin that helps you know the package name of any application running in foreground.

## When it can be used

- Know which app is opened in foreground while your app is running in background.
- Get the package name of your main app.

## Getting Started

Check the example folder for a complete working example about the plugin

```dart

Future<void> getPackageName() async {
  String packageName;
  try {
    packageName = await _activePackagePlugin.getActivePackageName() ??
        'Unknown package name';
  } catch (e) {
    packageName = 'Failed to get the active package name.';
  }

  // If the widget was removed from the tree while the asynchronous package name
  // method was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  if (!mounted) return;

  setState(() {
    _packageName = packageName;
  });
}

```
