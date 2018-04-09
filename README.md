# Simple tool for inclusion of files inside shell script

This tool enable any file (text or binary) to be included in shell script. The
script is then able to list or extract it provided that it include some helper
functions.

In order to avoid shell conflicts, the included files are generally inserted
after an explicit 'exit 0' at the end of the script, but it is possible to
choose the location of inclusion. The tool enable binary file to be included
in base64 form.

## Use case

I create this file in order to publish simple shell wrappers embedding needed
configuration file (for `openvpn` and `pandoc`/`pdflatex`). That way I was
able to distribute a single command which do everything at once.

## Documentation

Full documentation is included in the script itself and can be displayed when
using the `--help` option.

I try to follow [semantic versioning](https://semver.org/) with patch version
starting with ISO date of modification.

## License

This tool has been created by Bruno BEAUFILS and is distributed under the
terms of the [*GNU General Public License, version 2*](LICENSE).

Copyright (C) 2016-2018 Bruno BEAUFILS <bruno@boulgour.com>
