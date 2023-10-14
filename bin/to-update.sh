#!/bin/bash

echo -e "Pulling ${TOOLS_DIR}"
cd "${TOOLS_DIR}" && git pull && cd - || exit
