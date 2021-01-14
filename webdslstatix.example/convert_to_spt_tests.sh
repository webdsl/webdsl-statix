#!/bin/bash

# read options
while getopts "i:o:m:e:" opt; do
  case $opt in
    i)  in=$OPTARG          ;;
    o)  out=$OPTARG         ;;
    m)  module=$OPTARG      ;;
    e)  expectation=$OPTARG ;;
    *) echo "error" >&2
       exit 1
  esac
done

# validate option -i
if [ ! -d "$in" ]; then
    echo 'Option -i (input directory) missing or designates non-directory' >&2
    exit 1
fi

# validate option -o
if [ ! -d "$out" ]; then
    echo 'Option -o (output directory) missing or designates non-directory' >&2
    exit 1
fi

# validate option -m
if [ -z "$module" ]; then
    echo 'Option -m (module name) missing' >&2
    exit 1
fi

# validate option -m
if [ -z "$expectation" ]; then
    echo 'Option -e (expectation) missing' >&2
    exit 1
fi

function app_file_to_spt_file {
  local entry="$1"
  local output_dir="$2"
  local module_path="$3"

  local entry_basename_no_ext="$(basename -- "$entry" .app)"
  local spt_file="$output_dir/$entry_basename_no_ext.spt"
  
  cp -- "$entry" "$spt_file"
  echo "Copied $entry_basename_no_ext.app to $spt_file"
  echo -e "module analysis/$module_path/$entry_basename_no_ext\n\nlanguage webdsl-statix\n\ntest $entry_basename_no_ext [[\n$(cat $spt_file)\n]] analysis $expectation\n" > "$spt_file"
}

function directory_to_spt_files {
  local input_dir="$1"
  local output_dir="$2"
  local module_name="$3"
  
  for entry in "$input_dir"/*; do
    if test -d $entry; then
      local subdir_basename="$(basename -- "$entry")"
      local new_output_dir="$output_dir/$subdir_basename"
      mkdir -p "$new_output_dir"
      directory_to_spt_files "$entry" "$new_output_dir" "$module_name/$subdir_basename"
    elif [ ${entry: -4} == ".app" ]; then
      app_file_to_spt_file "$entry" "$output_dir" "$module_name"
    else
      echo "File (Not *.app): $entry"
    fi
  done
}

directory_to_spt_files "$in" "$out" "$module"
