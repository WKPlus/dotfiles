#!/bin/bash

python -c "import $1;import os;print os.path.dirname($1.__file__)"
