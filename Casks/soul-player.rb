cask "soul-player" do
  version "0.4.8"
  sha256 "e664f10aab05cacea14076d831bebe6150d068213ea753a760b21988c849add0"

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
