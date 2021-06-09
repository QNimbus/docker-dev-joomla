#!/bin/bash

# Simple configure script to setup Joomla installation (including database)
#
# Usage: ./configure.sh

CURRENT_DIR=$(pwd)

# Use syminked folders for development
if [ -d "${CURRENT_DIR}/joomla/components/com_markasread" ] && [ ! -d "${CURRENT_DIR}/joomla/components/com_markasread.bak" ]; then
  mv "${CURRENT_DIR}/joomla/components/com_markasread" "${CURRENT_DIR}/joomla/components/com_markasread.bak"
  ln -s "${CURRENT_DIR}/dev/joomla-briteblu-mark-as-read/component/com_markasread/site" "${CURRENT_DIR}/joomla/components/com_markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/administrator/components/com_markasread" ] && [ ! -d "${CURRENT_DIR}/joomla/administrator/components/com_markasread.bak" ]; then
  mv "${CURRENT_DIR}/joomla/administrator/components/com_markasread" "${CURRENT_DIR}/joomla/administrator/components/com_markasread.bak"
  ln -s "${CURRENT_DIR}/dev/joomla-briteblu-mark-as-read/component/com_markasread/admin" "${CURRENT_DIR}/joomla/components/com_markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/plugins/content/markasread" ] && [ ! -d "${CURRENT_DIR}/joomla/plugins/content/markasread.bak" ]; then
  mv "${CURRENT_DIR}/joomla/plugins/content/markasread" "${CURRENT_DIR}/joomla/plugins/content/markasread.bak"
  ln -s "${CURRENT_DIR}/dev/joomla-briteblu-mark-as-read/plugins/content/markasread" "${CURRENT_DIR}/joomla/plugins/content/markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/plugins/system/markasread_filter" ] && [ ! -d "${CURRENT_DIR}/joomla/plugins/system/markasread_filter.bak" ]; then
  mv "${CURRENT_DIR}/joomla/plugins/system/markasread_filter" "${CURRENT_DIR}/joomla/plugins/system/markasread_filter.bak"
  ln -s "${CURRENT_DIR}/dev/joomla-briteblu-mark-as-read/plugins/system/markasread_filter" "${CURRENT_DIR}/joomla/plugins/system/markasread_filter"
fi
