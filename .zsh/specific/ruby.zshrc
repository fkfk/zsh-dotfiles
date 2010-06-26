# 環境変数セット
export RUBYOPT='-rubygems'

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

# jrubyのせいでshell起動が遅くなっているため一旦消しとく
#if [ "`jgem -v 2> /dev/null`" ];then
#  export PATH=$PATH:`jgem env gempath`
#fi

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm
fi
