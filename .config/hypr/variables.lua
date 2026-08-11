return {
    terminal    = "kitty",
    fileManager = "nemo",
    menu        = "rofi -show drun",
    mainMod     = "SUPER",
    browser     = "zen-browser",
    crunchyroll = "~/.config/scripts/crunchyroll-app.sh",
    youtube     = "~/.config/scripts/youtube-app.sh",
    powerMenu   = "CTRL + ALT + DELETE",
    emojiPicker = 'rofi -modi "emoji:rofimoji" -show emoji',
    colorPicker = 'hyprpicker -a --radius=100',

    -----------------------------------------
    ---APPS
    -----------------------------------------
    kbBrowser          = "SUPER + B",
    kbCrunchyroll      = "SUPER + A",
    kbYoutube          = "SUPER + Y",
    -----------------------------------------
    --- Utilities
    -----------------------------------------
    kbScreenshot       = "SUPER + SHIFT + S",
    -----------------------------------------
    --- Media
    -----------------------------------------
    kbNextSong         = "CTRL + SUPER + RIGHT",
    kbPreviousSong     = "CTRL + SUPER + LEFT",
    kbToggleSong       = "CTRL + SUPER + DOWN",

    -----------------------------------------
    --- WorkSpaces
    -----------------------------------------
    kbSpecialCode      = "SUPER + CTRL + C",
    kbSpecialNotes     = "SUPER + CTRL + N",
    kbSpecialMedia     = "SUPER + CTRL + Y",
    kbSpecialAnime     = "SUPER + CTRL + A",
    kbSpecialMusic     = "SUPER + M",
    -----------------------------------------
    --- Windows
    -----------------------------------------
    kbToggleFullScreen = "SUPER + F",
    -----------------------------------------
    --- Features
    -----------------------------------------
    kbHyprLock = "SUPER + L",
}
