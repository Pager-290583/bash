#/bin/zsh

#Возращение вывода к стандартному форматированию
NORMAL='\033[0m'

# Цветом текста (жирный) (bold)
WHITE='\033[41m'

#Цвет фона
BGRED='\033[41m'
BGBREE='\033[42m'
BGBLUE='\033[44m'

# Получаем статус веб-сервера через systemd  записываем его в переменную
nginxstatus=$(systemctl status nginx | grep -Eo "running|dead|failed")

    if [[ $nginxstatus = 'running']]
        then
            echo -en  "${WHITE} ${BGGREEN} Веб сервер работает ${NORMAL}\n"
        else
            echo -en "${WHITE} ${BGRED} nginx не работает ${NORMAL}\n"
    fi