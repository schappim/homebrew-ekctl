# Homebrew Tap for ekctl

This is the official Homebrew tap for [ekctl](https://github.com/schappim/ekctl) - a native macOS CLI tool for managing Calendar events and Reminders via EventKit.

## Installation

```bash
# Add the tap
brew tap schappim/ekctl

# Install ekctl
brew install ekctl
```

## Usage

```bash
# List all calendars and reminder lists
ekctl list calendars

# List events in a date range
ekctl list events \
  --calendar "YOUR_CALENDAR_ID" \
  --from "2026-01-01T00:00:00Z" \
  --to "2026-01-31T23:59:59Z"

# Add an event
ekctl add event \
  --calendar "YOUR_CALENDAR_ID" \
  --title "Team Meeting" \
  --start "2026-01-15T09:00:00Z" \
  --end "2026-01-15T10:00:00Z"

# List incomplete reminders
ekctl list reminders --list "YOUR_LIST_ID" --completed false

# Add a reminder with due date
ekctl add reminder \
  --list "YOUR_LIST_ID" \
  --title "Call dentist" \
  --due "2026-01-20T09:00:00Z"

# Mark reminder as completed
ekctl complete reminder "REMINDER_ID"
```

## Permissions

On first run, macOS will prompt you to grant access to Calendars and Reminders. You can manage these permissions in:

- **System Settings → Privacy & Security → Calendars**
- **System Settings → Privacy & Security → Reminders**

## Documentation

For complete documentation and more examples, see the [ekctl README](https://github.com/schappim/ekctl).

## License

MIT License
