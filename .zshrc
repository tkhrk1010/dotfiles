# *-------------------------------
# prompt
# *-------------------------------
# https://github.com/romkatv/gitstatus
source /usr/local/opt/gitstatus/gitstatus.prompt.zsh

# *-------------------------------
# alias
# *-------------------------------
alias gitcd='git checkout develop'
alias gitpod='git pull origin develop'
alias bi='bundle install'
alias clipy='set -A array $(ps aux -m | grep Clipy | grep -v grep | grep $USER); kill $array[2]; osascript -e '\''run app "Clipy"'\'''


# *-------------------------------
# other
# *-------------------------------
# local IPを取得
export LOCAL_HOST_IP=`ifconfig en0 | grep inet | grep -v inet6 | sed -E "s/inet ([0-9]{1,3}.[0-9]{1,3}.[0-9].{1,3}.[0-9]{1,3}) .*$/\1/" | tr -d "\t"`

# 依存関係も含めてdocker imageをすべて消す
# https://zenn.dev/msickpaler/articles/607e562a52cf07
rmiAllFromChild() {
  ids=$(docker images -q)
  for id in ${ids}; do
    childId=$(
      for i in ${ids}; do
        docker history $i | grep -q $id && echo $i
      done | sort -u
    )
    docker rmi ${childId}
  done
}

export PATH="/usr/local/Cellar/node/14.17.6/bin/:$PATH"
# https://qiita.com/HayneRyo/items/d493a2b3cec2322f167c
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
