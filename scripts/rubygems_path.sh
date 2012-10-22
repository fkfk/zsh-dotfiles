_LOADED_SCRIPT_RUBYGEMS_PATH=1
# rubygemsのbinをPATHに追加
function _set_rubygems_path() {
  for p in `$1 -rubygems -e "Gem.path.each{|p| puts File.join(p,%Q|bin|)}"`; do
    if [ -d $p ]; then
      push path $p
    fi
  done
  export PATH
}
