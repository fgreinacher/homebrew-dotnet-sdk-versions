cask "dotnet-sdk9" do
  arch arm: "arm64", intel: "x64"

  version "9.0.101,9.0.0"
  sha256 :no_check

  url "https://github.com/isen-ng/homebrew-dotnet-sdk-versions/raw/master/META.md"
  name ".NET Core SDK #{version.csv.first}"
  desc "This cask follows releases from https://github.com/dotnet/core/tree/master"
  homepage "https://github.com/isen-ng/homebrew-dotnet-sdk-versions"

  depends_on cask: "dotnet-sdk9-0-100"
  depends_on macos: ">= :ventura"

  stage_only true
end
