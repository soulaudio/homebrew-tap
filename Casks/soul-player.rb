cask "soul-player" do
  version "0.4.6"
  sha256 "77b1cb623dc421040ce5467d661c9594dd5f1f275b87349e7af9fc4fdf0a2cd8"

  url "https://github.com/soulaudio/soul-player-ng/releases/download/v#{version}/Soul-Player_#{version}_universal.dmg"
  name "Soul Player"
  desc "Gapless, bit-perfect music player for local and remote libraries"
  homepage "https://github.com/soulaudio/soul-player-ng"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Soul Player.app"

  uninstall quit: "co.soulaudio.soulplayer"

  zap trash: [
    "~/Library/Application Support/soul-player",
    "~/Library/Caches/co.soulaudio.soulplayer",
    "~/Library/Caches/soul-player",
    "~/Library/HTTPStorages/co.soulaudio.soulplayer",
    "~/Library/Logs/Soul Player",
    "~/Library/Preferences/co.soulaudio.soulplayer.plist",
    "~/Library/Saved Application State/co.soulaudio.soulplayer.savedState",
  ]

  caveats <<~EOS
    Soul Player is not notarized by Apple yet. If macOS blocks the first launch,
    open System Settings -> Privacy & Security and click "Open Anyway".
    Soul Player updates itself; `brew upgrade` leaves it alone.
  EOS
end
