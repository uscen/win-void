# ================================================#
# List Packages:      		                      #
# ================================================#
$packages=@(
    "typescript",
    "sass",
    "yarn"
    "eslint",
    "eslint-config-airbnb",
    "eslint-config-google",
    "eslint-config-standard",
    "eslint-plugin-import",
    "eslint-plugin-jsx-a11y",
    "eslint-plugin-node",
    "eslint-plugin-promise",
    "eslint-plugin-react",
    "eslint-plugin-react-hooks",
    "firebase-tools"
)
$extensions=@(
    # General
    "vscodevim.vim"                      # Vim Keybidings
    "glenn2223.live-sass"                # SASS Compiler
    "christian-kohler.path-intellisense" # File path autocomplete
    "esbenp.prettier-vscode"             # Prettier - Code formatter
    "hookyqr.beautify"                   # HTML/JSON beautifier
    "mhutchie.git-graph"                 # Git graph
    "mikestead.dotenv"                   # .env support
    "tyriar.lorem-ipsum"                 # Lorem Ipsum generator
    "yzhang.markdown-all-in-one"         # Markdown tools
    # Node/NPM/Yarn specific extensions
    "christian-kohler.npm-intellisense"  # NPM better autocomplete
    "dbaeumer.vscode-eslint"             # Eslint support
    # Themes
    "github.github-vscode-theme"         # GitHub color theme
    "jdinhlife.gruvbox"                  # Gruvbox Theme
    "pkief.material-icon-theme"          # Material Icon Theme
)

# ================================================#
# NPM Paclages:      		                      #
# ================================================#
foreach ($package in $packages) {
        Write-Host "Installing $package..."
        npm install -g $package
}
Write-Host "Installation Of NPM Packages Is Complete!"
# ================================================#
# Vscode Paclages:      		                  #
# ================================================#
foreach ($extension in $extensions) {
        code --install-extension $extension --force
}
Write-Host "Installation Of Visual Studio Code extensions Is Complete!"
