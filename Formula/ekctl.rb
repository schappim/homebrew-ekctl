class Ekctl < Formula
  desc "macOS CLI tool for managing Calendar events and Reminders via EventKit"
  homepage "https://github.com/schappim/ekctl"
  url "https://github.com/schappim/ekctl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9e903bd8d20e82b1a17892d215ceb0493f634d2d0be4ad97708f753e4018b34d"
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
        # List all calendars
        ekctl list calendars

        # List events in a calendar
        ekctl list events --calendar <calendar_id> --from 2026-01-01T00:00:00Z --to 2026-01-31T23:59:59Z

        # Add an event
        ekctl add event --calendar <calendar_id> --title "Meeting" --start 2026-01-15T09:00:00Z --end 2026-01-15T10:00:00Z

      For more examples, see: https://github.com/schappim/ekctl#usage
    EOS
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/ekctl --version")
    assert_match "calendars", shell_output("#{bin}/ekctl list --help")
  end
end
