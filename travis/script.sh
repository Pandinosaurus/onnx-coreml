#!/bin/bash

source "${0%/*}/setup.sh"

# Mypy only works with Python 3
if [ "${PYTHON_VERSION}" != "python2" ]; then
  time mypy .
  # TODO Also test in python2 mode (but this is still in the python 3 CI
  # instance, because mypy itself needs python 3)
  # time mypy --py2 .
fi

#time python setup.py test
time python -m unittest tests.transformers_test
time python -m unittest tests.convert_test
time python -m unittest tests.graph_test
time python -m unittest -m tests.operators_test
time python -m unittest -m tests.onnx_backend_models_test