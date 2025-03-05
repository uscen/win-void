# ================================================#
# List Packages:      		                        #
# ================================================#
$packages=@(
    # PACKAGE MANAGER:                                #
    # ================================================#
    "bun",
    "yarn",
    "pnpm"
    # LANGUGE SERVER PORTOCOL:                        #
    # ================================================#
    "vscode-langservers-extracted",
    "@tailwindcss/language-server",
    "@vtsls/language-server",
    "prettier"
)
$extensions=@(
    "vscodevim.vim"
    "dsznajder.es7-react-js-snippets"
    "bradlc.vscode-tailwindcss",
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "glenn2223.live-sass"
    "esbenp.prettier-vscode"
    "yzhang.markdown-all-in-one"
    "prisma.prisma"
    "pkief.material-icon-theme"
)

# ================================================#
# NPM Paclages:      		                          #
# ================================================#
foreach ($package in $packages) {
        Write-Host "Installing $package..."
        npm install -g $package
}
Write-Host "Installation Of NPM Packages Is Complete!"
# ================================================#
# Vscode Paclages:      		                      #
# ================================================#
foreach ($extension in $extensions) {
        code --install-extension $extension --force
}
Write-Host "Installation Of Visual Studio Code extensions Is Complete!"
