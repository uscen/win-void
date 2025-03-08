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
    "typescript",
    "typescript-language-server",
    "vscode-langservers-extracted",
    "@tailwindcss/language-server",
    "@biomejs/biome"
)
$extensions=@(
    "jdinhlife.gruvbox"
    "vscodevim.vim"
    "dsznajder.es7-react-js-snippets"
    "bradlc.vscode-tailwindcss"
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "esbenp.prettier-vscode"
    "yzhang.markdown-all-in-one"
    "prisma.prisma"
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
