# Docker aliases

if [[ " ${plugins[*]} " == *" docker "* ]]; then
  alias d='docker'
  alias dim='docker image'
  alias dimp='docker image prune'
  alias dims='docker images'
  alias dkl='docker kill'
  alias dlg='docker logs'
  alias dlgf='docker logs --follow'
  alias dps='docker ps'
  alias dpsa='docker ps --all'
  alias drm='docker rm'
  alias drmi='docker rmi'
  alias drn='docker run'
  alias dsp='docker stop'
  alias dst='docker start'
fi

if [[ " ${plugins[*]} " == *" docker-compose "* ]]; then
  chalias dcb dcbd
  chalias dce dcex
  alias dcdnv='docker-compose down --volumes'
  chalias dck dckl
  chalias dcl dclg
  chalias dclf dclgf
  chalias dcpull dcpl
  chalias dcr dcrn
  chalias dcrestart dcrs
  chalias dcstop dcsp
  chalias dcstart dcst
fi
