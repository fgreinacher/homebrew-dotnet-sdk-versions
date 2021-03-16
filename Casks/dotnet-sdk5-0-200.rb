cask "dotnet-sdk5-0-200" do
  version "5.0.201,5.0.4"
  sha256 "6206d6994fe23c3e7cc26543e5a5e231cacd0a6e14e86bbc0636054114144adc47c8a7cb6e99fa05c7414c34c47c935937b32d41ea9eeb794aaf1702ff2be74c"

  url "https://download.visualstudio.microsoft.com/download/pr/de613120-9306-4867-b504-45fcc81ba1b6/2a03f18c549f52cf78f88afa44e6dc6a/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
  name ".NET Core SDK #{version.before_comma}"
  desc "This cask follows releases from https://github.com/dotnet/core/tree/master"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: "> :sierra"

  pkg "dotnet-sdk-#{version.before_comma}-osx-x64.pkg"

  uninstall pkgutil: "com.microsoft.dotnet.dev.#{version.before_comma}.component.osx.x64"

  zap trash:   ["~/.dotnet", "~/.nuget"],
      pkgutil: [
        "com.microsoft.dotnet.hostfxr.#{version.after_comma}.component.osx.x64",
        "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.#{version.after_comma}.component.osx.x64",
        "com.microsoft.dotnet.sharedhost.component.osx.x64",
      ]

  caveats "Uninstalling the offical dotnet-sdk casks will remove the shared runtime dependencies, "\
          "so you\'ll need to reinstall the particular version cask you want from this tap again "\
          "for the `dotnet` command to work again."
end
