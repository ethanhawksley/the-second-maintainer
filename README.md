# The Second Maintainer

## Inside the XZ Utils Backdoor

This repository contains the source files for "The Second Maintainer". This is hosted on [hawksley.dev](https://hawksley.dev/the-second-maintainer).

## Build

Install dependencies

```sh
# if fedora
sudo dnf install pandoc weasyprint python3

# if debian/ubuntu
sudo apt update
sudo apt install -y pandoc weasyprint python3
```

Clone the repo.

```sh
git clone https://github.com/ethanhawksley/the-second-maintainer
cd the-second-maintainer
```

Run the build script.

```sh
chmod +x build.sh
./build.sh
```

This will output four files inside /src:  interior.pdf, interior-6x9.pdf, the-second-maintainer.pdf, and the-second-maintainer.epub.

These files can also be downloaded from [hawksley.dev/the-second-maintainer](https://hawksley.dev/the-second-maintainer) or from GitHub releases.

## License

© 2026 Ethan Hawksley

### Prose in `src/`
Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).  
Attribution: Please credit as "Ethan Hawksley, *The Second Maintainer* (2026), https://hawksley.dev/the-second-maintainer".  
See `LICENSE` for full terms.

### Tools in `publish/`
Adapted from [mattgemmell/pandoc-publish](https://github.com/mattgemmell/pandoc-publish), licensed under GPL-3.0.
Modifications have been made, see git history for details.  
See `publish/LICENSE-TOOLS` for full terms.
