## Requirements

* Pandoc 1.12.4.2 with pandoc-citeproc (see http://johnmacfarlane.net/pandoc/installing.html#all-platforms). Ubuntu 14.04 only provides version 1.12.2.1 which does not produce proper cross references in the HTML output.
* [pandocfilters](https://github.com/jgm/pandocfilters) for Python
* TeX Live (`texlive-full`)
* Inkscape for SVG conversion
* Biber

## Usage

* Clone this repository:
  ```bash
  git clone git@github.com:phdd/pandoc-ieee-conference.git
  ```

* Use `make`, `make pdf` or `make html` to generate the publication in your desired output format.

## Acknowledgements

* latexrun (https://github.com/aclements/latexrun)
* IEEEtran Latex class for conference publications
  (http://www.ieee.org/conferences_events/conferences/publishing/templates.html)
* Latex Tables Pandoc-Filter by Wagner Macedo
  (https://groups.google.com/d/msg/pandoc-discuss/RUC-tuu_qf0/h-H3RRVt1coJ)

## License

Copyright 2017 Peter Heisig

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
