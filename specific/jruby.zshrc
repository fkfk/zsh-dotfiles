_LOADED_SPECIFIC_JRUBY=1
if [ ! $_LOADED_SCRIPT_RUBYGEMS_PATH ]; then
  source $ADD_FUNC_DIR/rubygems_path.sh
fi
if [ "`jgem -v 2> /dev/null`" ];then
  _set_rubygems_path "jruby"
fi
