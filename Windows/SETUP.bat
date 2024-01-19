@echo off
setlocal

set ABSOLUTE_PATH_TO_WORKING_FOLDER=%cd%

python -m venv venv
call venv\Scripts\activate
python -m pip install label-studio

set LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
set LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=%ABSOLUTE_PATH_TO_WORKING_FOLDER%

label-studio
