function keynotepdf2slideshare() {
  if [ $# -ne 1 ]; then
    echo "usage: keynotepdf2slideshare pdf_path" 1>&2
    return 1
  fi

  arg=$1
  if [ ${arg##*.} != "pdf" ]; then
    echo 'no match of file extension' 1>&2
    return 1
  fi

  bash -c "LANG=C LC_ALL=C sed -e 's|/Registry (Adobe) /Ordering (Japan1) /Supplement [0-9]|/Registry(Adobe) /Ordering(Identity) /Supplement 0|g' $arg > ${arg}.new"
}
