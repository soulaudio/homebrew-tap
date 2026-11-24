# soulaudio/tap

Homebrew tap for [Soul Player](https://github.com/soulaudio/soul-player-ng), a gapless, bit-perfect music player.

## Install

```sh
brew tap soulaudio/tap
brew trust soulaudio/tap        # Homebrew asks you to trust third-party taps once
brew install --cask soul-player
```

This installs the universal build (Apple silicon and Intel) to `/Applications`.

Soul Player isn't notarized by Apple yet. If macOS blocks the first launch, open
**System Settings → Privacy & Security** and click **Open Anyway**.

## Updates

Soul Player updates itself (Settings → Updates), so the cask is marked `auto_updates`
and `brew upgrade` leaves it alone. To move to the newest cask anyway:
`brew upgrade --cask --greedy soul-player`.

## Uninstall

```sh
brew uninstall --cask soul-player          # the app
brew uninstall --cask --zap soul-player    # the app and everything it stored (settings, playlists, caches, logs)
```

Your music files are never touched. Settings → About → Uninstall in the app does the same as `--zap`.

## How this tap is maintained

After each Soul Player release is published and verified, its release workflow
regenerates `Casks/soul-player.rb` with
[`gen-cask.py`](https://github.com/soulaudio/soul-player-ng/blob/main/.github/scripts/gen-cask.py)
and opens a pull request here. `cask-ci` (style, audit, livecheck, then install from this
tap on a real Mac, launch, zap) must pass before it merges. The release then installs the
cask from this tap once more, as a user would; if that fails, it reverts the change the
same way. Please open issues in
[soulaudio/soul-player-ng](https://github.com/soulaudio/soul-player-ng/issues).
