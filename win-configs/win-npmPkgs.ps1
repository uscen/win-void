# ================================================#
# NPM Paclages:      		                      #
# ================================================#
$packages=@(
  "typescript",
  "sass",
  "yarn"
)
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    try {
        npm install -g $package
        Write-Host "$package installed successfully."
    } catch {
        Write-Host "Failed to install $package."
    }
}
Write-Host "Installation Of NPM Packages Is Complete!"
