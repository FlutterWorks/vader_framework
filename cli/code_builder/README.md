# code_builder
Program for generating some parts of code during development.


## Build
Run command: `bin/setup.sh build`

## Install
Run command: `bin/setup.sh install`

## Usage:
```
-t, --type         Type of created code.
-n, --name         Component name.
-p, --package      Package name.
-d, --directory    Root directory for output.
-o, --output       Output directory.
-h, --help         Print help information.
-V, --verbose      Show additional command output.
-v, --version      Print program version.
```


## Example
```
./bin/code_builder -t component -p example_design -n AnotherButton -o output/design/buttons
./bin/code_builder -t example -p example_design -n Martin -o output
```


## Special thanks

 - [Dart](https://dart.dev/): Client-optimized language for fast apps on any platform.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## Author

👤 **Martin Jablečník**

* Website: [martin-jablecnik.cz](https://www.martin-jablecnik.cz)
* Github: [@mjablecnik](https://github.com/mjablecnik)
* Blog: [dev.to/mjablecnik](https://dev.to/mjablecnik)


## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/mjablecnik">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>


## 📝 License

Copyright © 2024 [Martin Jablečník](https://github.com/mjablecnik).<br />
This project is [GNU GPLv3 License](https://choosealicense.com/licenses/gpl-3.0/) licensed.


