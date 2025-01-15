# ================================================#
# List Packages:      		                      #
# ================================================#
$packages=@(
    "bun",
    "yarn",
    "pnpm"
    # "firebase-tools",
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
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "glenn2223.live-sass"
    "esbenp.prettier-vscode"
    "yzhang.markdown-all-in-one"
    # Themes
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
