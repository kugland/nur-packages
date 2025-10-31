{ pkgs
, lib
,
}:
let
  pname = "cursor";
  version = "https://cursor.com/download/stable/linux-x64";
  url = "https://downloads.cursor.com/production/45fd70f3fe72037444ba35c9e51ce86a1977ac11/linux/x64/Cursor-2.0.34-x86_64.AppImage";
  hash = "sha256-x51N2BttMkfKwH4/Uxn/ZNFVPZbaNdsZm8BFFIMmxBM=";
  src = pkgs.fetchurl { inherit url hash; };
  appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    mkdir -p $out/share/icons
    (
      cd ${appimageContents}/usr
      for dir in share/icons/*/*/apps; do
        mkdir -p $out/$dir
        cp $dir/cursor.png $out/$dir/cursor.png || true
        cp $dir/cursor.png $out/$dir/co.anysphere.cursor.png || true
        cp $dir/cursor.svg $out/$dir/cursor.svg || true
        cp $dir/cursor.svg $out/$dir/co.anysphere.cursor.svg || true
      done
    )
    mkdir -p $out/share/applications
    cp -r ${appimageContents}/usr/share/applications $out/share/
    # Patch desktop file to use the correct executable
    sed -i 's|^Exec=/usr/share/cursor/cursor|Exec=cursor|' $out/share/applications/*.desktop
  '';
  meta = {
    description = "AI-first code editor built on VS Code, designed to enhance productivity through AI-assisted coding";
    longDescription = ''
      Cursor is an AI-powered code editor that extends VS Code's functionality with advanced AI capabilities,
      such as AI-assisted code completion and refactoring, natural language command processing.
    '';
    homepage = "https://cursor.com";
    downloadPage = "https://cursor.com/download";
    changelog = "https://github.com/getcursor/cursor/releases";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ lib.maintainers.kugland ];
    mainProgram = "cursor";
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
