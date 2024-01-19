#!/bin/bash


ABSOLUTE_PATH_TO_YOUR_WORKING_FOLDER="$(pwd)"

python -m venv venv
source venv/bin/activate
python -m pip install label-studio

export LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
export LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT="$ABSOLUTE_PATH_TO_YOUR_WORKING_FOLDER"

label-studio
