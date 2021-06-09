#!/bin/bash

# Simple configure script to setup Joomla installation (including database)
#
# Usage: ./configure.sh

CURRENT_DIR=$(pwd)

# Use syminked folders for development
if [ -d "${CURRENT_DIR}/joomla/components/com_markasread.bak" ] && [ -L "${CURRENT_DIR}/joomla/components/com_markasread" ]; then
  rm -rf "${CURRENT_DIR}/joomla/components/com_markasread"
  mv "${CURRENT_DIR}/joomla/components/com_markasread.bak" "${CURRENT_DIR}/joomla/components/com_markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/administrator/components/com_markasread.bak" ] && [ -L "${CURRENT_DIR}/joomla/administrator/components/com_markasread" ]; then
  rm -rf "${CURRENT_DIR}/joomla/administrator/components/com_markasread"
  mv "${CURRENT_DIR}/joomla/administrator/components/com_markasread.bak" "${CURRENT_DIR}/joomla/administrator/components/com_markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/plugins/content/markasread.bak" ] && [ -L "${CURRENT_DIR}/joomla/plugins/content/markasread" ]; then
  rm -rf "${CURRENT_DIR}/joomla/plugins/content/markasread"
  mv "${CURRENT_DIR}/joomla/plugins/content/markasread.bak" "${CURRENT_DIR}/joomla/plugins/content/markasread"
fi

if [ -d "${CURRENT_DIR}/joomla/plugins/system/markasread_filter.bak" ] && [ -L "${CURRENT_DIR}/joomla/plugins/system/markasread_filter" ]; then
  rm -rf "${CURRENT_DIR}/joomla/plugins/system/markasread_filter"
  mv "${CURRENT_DIR}/joomla/plugins/system/markasread_filter.bak" "${CURRENT_DIR}/joomla/plugins/system/markasread_filter"
fi
