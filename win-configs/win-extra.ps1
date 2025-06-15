# =============================================================================== #
# List Packages:      		                                                        #
# =============================================================================== #
$packages=@(
    # PACKAGE MANAGER:                                                                #
    # =============================================================================== #
    "bun",
    "yarn",
    "pnpm"
    # LANGUGE SERVER PORTOCOL:                                                        #
    # =============================================================================== #
    "vscode-langservers-extracted",
    "@vtsls/language-server",
    "@olrtg/emmet-language-server",
    "@tailwindcss/language-server",
    "@prisma/language-server",
    "prettier"
)
# =============================================================================== #
# NPM Packages:      		                                                          #
# =============================================================================== #
foreach ($package in $packages) {
        Write-Host "Installing $package..."
        npm install -g $package
}
Write-Host "Installation Of NPM Packages Is Complete!"
# =============================================================================== #
# Vscode Extension:      		                                                      #
# =============================================================================== #
$extensions=@(
    "manas.paradise-vscode"
    "vscodevim.vim"
    "dsznajder.es7-react-js-snippets"
    "bradlc.vscode-tailwindcss"
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "esbenp.prettier-vscode"
    "yzhang.markdown-all-in-one"
    "prisma.prisma"
)

foreach ($extension in $extensions) {
        code --install-extension $extension --force
}
Write-Host "Installation Of Visual Studio Code extensions Is Complete!"
