_rake () {
  if [ -f Rakefile ]; then
    compadd `rake -T | awk "{print \\$2}" | xargs`
  fi
}
compdef _rake rake
