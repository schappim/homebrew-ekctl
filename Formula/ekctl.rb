class Ekctl < Formula
  desc "macOS CLI tool for managing Calendar events and Reminders via EventKit"
  homepage "https://github.com/schappim/ekctl"
  url "https://github.com/schappim/ekctl/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "593d6ba765e2db665f368479c7ca0d2697a2f955f7de22697f46884bb866f3fb"
  license "MIT"
  head "https://github.com/schappim/ekctl.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/ekctl"
  end

  def caveats
    <<~EOS
      On first run, macOS will prompt you to grant access to Calendars and Reminders.
      You can manage these permissions in:
        System Settings → Privacy & Security → Calendars
        System Settings → Privacy & Security → Reminders

      Quick start:
        # List all calendars and get their IDs
        ekctl list calendars

        # Set up aliases for easier use
        ekctl alias set work "YOUR_CALENDAR_ID"
        ekctl alias set personal "YOUR_REMINDERS_ID"

        # Use aliases in commands
        ekctl list events --calendar work --from 2026-01-01T00:00:00Z --to 2026-01-31T23:59:59Z
        ekctl add event --calendar work --title "Meeting" --start 2026-01-15T09:00:00Z --end 2026-01-15T10:00:00Z
        ekctl add reminder --list personal --title "Call mom"

      For more examples, see: https://github.com/schappim/ekctl#usage
    EOS
  end

  test do
    assert_match "1.2.0", shell_output("#{bin}/ekctl --version")
    assert_match "calendars", shell_output("#{bin}/ekctl list --help")
    assert_match "alias", shell_output("#{bin}/ekctl --help")
  end
end
