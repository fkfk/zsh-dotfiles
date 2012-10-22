_LOADED_SPECIFIC_RUBY=1
if [ ! $_LOADED_SCRIPT_RUBYGEMS_PATH ]; then
  source $SCRIPTS_DIR/rubygems_path.sh
fi
# rubygemsのbinをPATHに追加
if [ "`gem -v 2>/dev/null`" ]; then
  _set_rubygems_path "ruby"
fi

if [ "`gem1.9.1 -v 2>/dev/null`" ]; then
  _set_rubygems_path "ruby1.9.1"
fi

if [ "`gem1.8 -v 2>/dev/null`" ]; then
  _set_rubygems_path "ruby1.8"
fi

if [ "`gem1.9 -v 2> /dev/null`" ];then
  _set_rubygems_path "ruby1.9"
fi
