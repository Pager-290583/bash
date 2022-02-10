#/bin/bash 

# Возвращение вывода к стандартному форматированию
NORMAL='\033[0m'      # ${NORMAL} 

# Цветом текста (жирным) (bold) :
WHITE='\033[1;37m'    # ${WHITE}

# Цвет фона
BGRED='\033[41m'      # ${BGRED}
BGGREEN='\033[42m'    # ${BGGREEN}
BGBLUE='\033[44m'     # ${BGBLUE}


# Получаем статус веб-сервера через systemd  записываем его в переменную
nginxstatus=$(systemctl status nginx | grep -Eo "running|dead|failed")

    if [[ $nginxstatus = 'running']]
        then
            echo -en  "${WHITE} ${BGGREEN} Веб сервер работает ${NORMAL}\n"
        else
            echo -en "${WHITE} ${BGRED} nginx не работает ${NORMAL}\n"
            systemctl restart nginx # перезапуск nginx
            sleep 1 #ожидаем 1 секунду
            echo -en "${WHITE} ${BGGREEN} Статус nginx после перезапуска $(systemctl status nginx | grep -Eo "running|dead|faoled") $(NORMAL)\n"
            
            echo $(curl -I 192.168.1.156 | grep OK) # Опрос сервиса nginx
    fi
# получаем статус php через переменную и записываем его в переменную
phpfpmstatus='systemctl status php7.2-fpm | grep -Eo "running|dead|failed"'

    if [[$phpfpmstatus = 'running']]
        then
            echo -en  "${WHITE} ${BGGREEN} Веб сервер работает ${NORMAL}\n"
        else
            echo -en "${WHITE} ${BGRED} php7.2-fpm не работает ${NORMAL}\n"
            systemctl restart php7.2-fpm # перезапуск php7.2-fpm
            sleep 1 #ожидаем 1 секунду
            echo -en "${WHITE} ${BGGREEN} Статус nginx после перезапуска $(systemctl status php7.2-fpm | grep -Eo "running|dead|faoled") $(NORMAL)\n"
            
            echo $(curl -I 192.168.1.156 | grep OK) # Опрос сервиса nginx
    fi