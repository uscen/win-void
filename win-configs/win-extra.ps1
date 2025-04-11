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
    "typescript",
    "typescript-language-server",
    "vscode-langservers-extracted",
    "@olrtg/emmet-language-server",
    "@tailwindcss/language-server",
    "@biomejs/biome"
)
# =============================================================================== #
# NPM Packages:      		                                                          #
# =============================================================================== #
foreach ($package in $packages) {
        Write-Host "Installing $package..."
        npm install -g $package
}
Write-Host "Installation Of NPM Packages Is Complete!"
