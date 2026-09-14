# HDI_GetPictureFormats

A 4D **HDI** (How Do I) example demonstrating how to enumerate the picture formats contained in a `Picture` field/variable, cross-check them against the codecs supported by the host OS, and flag deprecated formats -- originally a v16 binary database, converted to a modern 4D project and modernised with the help of **GitHub Copilot**.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (see below) for current 4D language and platform conventions.

- **Blog post:** https://blog.4d.com/get-list-of-formats-contained-in-c_picture/
- **Original download:** https://download.4d.com/Demos/4D_v16/HDI_GetPictureFormats.zip

## Features

- Splash screen (`splashScreen` form) with version/license gating before entering the demo, reusing an already-open window instead of stacking duplicates.
- Main demo form (`HDI-Get_picture_formats`) with tabbed pages: a description page, a live "Table_1" record browser (list box), and a code walkthrough page.
- For the picture stored in the current record, lists every codec ID returned by `GET PICTURE FORMATS`, cross-references it against `PICTURE CODEC LIST` (the codecs actually supported by the current OS), and reports each as supported, unsupported, or deprecated.
- Deprecated-format detection via the 4D Pack plugin command `_o_AP_Is_Picture_Deprecated`.
- Fully localised UI and messages (English/Japanese) via XLIFF, and a dark-mode-aware, Liquid-Glass-aware UI (see below).

## Points of interest

- **`GET PICTURE FORMATS` / `PICTURE CODEC LIST` / `CONVERT PICTURE`** -- see [`Get_PictureCodecDetail.4dm`](Project/Sources/Methods/Get_PictureCodecDetail.4dm) for the pattern of enumerating a picture's embedded formats and testing each one against the codecs available on the current machine.
- **`_o_AP_Is_Picture_Deprecated`** -- a 4D Pack plugin command used to detect a deprecated picture format; called once per candidate format in a loop, passed a picture variable by reference (`->$pictureInSignleFormat`).
- **Startup/window-reuse pattern** -- [`00_Start.4dm`](Project/Sources/Methods/00_Start.4dm) shows the modern splash-screen idiom: `CALL WORKER` (instead of `New process`) to hop into the application process, non-blocking `DIALOG(...; *)`, and enumerating open windows with `WINDOW LIST`/`Window process` to bring an existing splash to the front rather than opening a second one.
- **`Form`-scoped state instead of interprocess variables** -- the splash screen's quit/continue decision is carried on `Form.quit` rather than a `<>`-prefixed interprocess variable, since interprocess variables now doing this job are prone to bleeding into unrelated processes and are unnecessary once the state is passed with `DIALOG(...; Form; *)`.
- **XLIFF localisation** -- every UI string and method-level message is resolved through `:xliff:` references (JSON) or `Localized string(...)` (method code) instead of being hardcoded; see `Resources/en.lproj/` and `Resources/ja.lproj/` for the per-purpose translation files (menu, splash form, detail form, messages).
- **Dark mode & Liquid Glass CSS** -- `Project/Sources/styleSheets*.css` use `prefers-color-scheme` media queries with 4D's `"automatic"`/`"automaticAlternate"` colour keywords, and `form-theme: liquid-glass` / `mac-classic` media queries to size push buttons correctly under macOS Tahoe's Liquid Glass appearance.
- **List box hygiene** -- the record browser list box uses `"resizingMode": "legacy"` (only the last column grows) and `"truncateMode": "none"` (no ellipsis truncation) so column widths and text remain predictable.

## References

- `GET PICTURE FORMATS`: https://developer.4d.com/docs/commands/get-picture-formats
- `PICTURE CODEC LIST`: https://developer.4d.com/docs/commands/picture-codec-list
- `CONVERT PICTURE`: https://developer.4d.com/docs/commands/convert-picture
- CSS in 4D forms: https://developer.4d.com/docs/FormEditor/stylesheets
- Liquid Glass in 4D: https://blog.4d.com/the-new-macos-tahoe-design-comes-to-your-4d-applications/

## Screenshots
