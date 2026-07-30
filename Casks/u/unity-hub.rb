cask "unity-hub" do
  arch arm: "arm64", intel: "x64"

  version "3.20.0"
  sha256 arm:   "1d3bed9cbc36b813921b68a4bb63ebfd97c8e054833531529b53f9c50b003aa7",
         intel: "0a7174318f270cf41eee9ec641c770123947644bbf4a8af6969529fecc41dddb"

  url "https://public-cdn.cloud.unity3d.com/hub/prod/#{version}/UnityHubSetup-#{version}-#{arch}.dmg"
  name "Unity Hub"
  desc "Management tool for Unity"
  homepage "https://unity3d.com/get-unity/download"

  livecheck do
    url "https://public-cdn.cloud.unity3d.com/hub/prod/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Unity Hub.app"

  uninstall quit: "com.unity3d.unityhub"

  zap trash: [
        "~/Library/Application Support/UnityHub",
        "~/Library/Preferences/com.unity3d.unityhub.helper.plist",
        "~/Library/Preferences/com.unity3d.unityhub.plist",
      ],
      rmdir: "/Applications/Unity/Hub"
end
