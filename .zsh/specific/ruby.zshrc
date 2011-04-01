_LOADED_SPECIFIC_RUBY=1
# rubygemsのbinをPATHに追加
if [ "`gem -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.9.1 -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby1.9.1 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.8 -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby1.8 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.9 -v 2> /dev/null`" ];then
  export PATH=$PATH:`ruby1.9 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi
