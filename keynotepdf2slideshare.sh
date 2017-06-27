function keynotepdf2slideshare() {
  extension=${1##*.}

  if [ $extension != "pdf" ]; then
    echo 'Suffix needs to "pdf"' 1>&2

    return 1
  fi

  if [ $# -eq 1 ]; then
    bash -c "LANG=C LC_ALL=C sed -i 's|/Registry (Adobe) /Ordering (Japan1) /Supplement [0-9]|/Registry(Adobe) /Ordering(Identity) /Supplement 0|g' $1"
  else
    echo "usage: convert_uploadable_keynote_pdf pdf_path" 1>&2

    return 1
  fi
}
