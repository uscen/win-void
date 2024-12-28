# ================================================#
# List Packages:      		                      #
# ================================================#
$packages=@(
    "live-server",
    "typescript",
    "sass",
    "yarn"
    "firebase-tools"
    # "eslint",
    # "eslint-config-airbnb",
    # "eslint-config-google",
    # "eslint-config-standard",
    # "eslint-plugin-import",
    # "eslint-plugin-jsx-a11y",
    # "eslint-plugin-node",
    # "eslint-plugin-promise",
    # "eslint-plugin-react",
    # "eslint-plugin-react-hooks",
)
$extensions=@(
    # General
    "vscodevim.vim"
    "dsznajder.es7-react-js-snippets"
    "bradlc.vscode-tailwindcss",
    "austenc.tailwind-docs",
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "steoates.autoimport"
    "glenn2223.live-sass"
    "christian-kohler.path-intellisense"
    "esbenp.prettier-vscode"
    "eamodio.gitlens"
    "mhutchie.git-graph"
    "mikestead.dotenv"
    "tyriar.lorem-ipsum"
    "yzhang.markdown-all-in-one"
    # Node/NPM/Yarn specific extensions
    "christian-kohler.npm-intellisense"
    "dbaeumer.vscode-eslint"
    # Themes
    "github.github-vscode-theme"
    "sainnhe.gruvbox-material"
    "pkief.material-icon-theme"
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
