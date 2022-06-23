# Docker aliases

if [[ " ${plugins[*]} " == *" docker-compose "* ]]; then
  chalias dcb dcbd # docker compose build
  chalias dce dcxc # docker compose exec
  alias dcdnv="$(alias dco | sed -E "s/.+'(.+)'/\1/") down --volumes"
  chalias dck dckl # docker compose kill
  chalias dcl dclg # docker compose logs
  chalias dclf dclgf # docker compose logs --follow
  chalias dcpull dcpl # docker compose pull
  chalias dcr dcrn # docker compose run
  chalias dcrestart dcrest # docker compose restart
  chalias dcstart dcst # docker compose start
  chalias dcstop dcstp # docker compose stop
fi

if [[ " ${plugins[*]} " == *" docker "* ]]; then
  unalias dbl
  alias dbr='docker builder'
  alias dcr='docker container'
  unalias dcin
  alias dim='docker image'
  chalias dib dimb # docker image build
  unalias dii
  chalias dils dimls # docker image ls
  alias dimpl='docker image pull'
  alias dimpr='docker image prune'
  chalias dipu dimps # docker image push
  chalias dirm dimrm # docker image rm
  chalias dit dimtg # docker image tag
  alias dkl='docker kill'
  chalias dlo dlg # docker logs
  alias dlgf='docker logs --follow'
  alias dnw='docker network'
  chalias dncn dnwcn # docker network connect
  chalias dnc dnwcr # docker network create
  chalias dndcn dnwdcn # docker network disconnect
  chalias dni dnwi # docker network inspect
  chalias dnls dnwls # docker network ls
  chalias dnrm dnwrm # docker network rm
  chalias dcls dps # docker ps
  chalias dclsa dpsa # docker ps --all
  unalias dpu
  chalias dr drn # docker run
  chalias drit drnit # docker run --interactive --tty
  alias dvl='docker volume'
  chalias dvi dvli # docker volume inspect
  chalias dvls dvlls # docker volume ls
  chalias dvprune dvlpr # docker volume prune
fi
