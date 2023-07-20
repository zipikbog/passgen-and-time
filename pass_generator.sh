#!/bin/bash
long=10
number=5
while getopts "hn:l:" option; do
  case "${option}" in
    n) if [[ ${OPTARG} =~ ^[0-9]+$ ]] ; then number=${OPTARG}; else echo "задано не верное количество паролей" >&2; exit 1; fi ;;
    l) if [[ ${OPTARG} =~ ^[0-9]+$ ]] ; then long=${OPTARG}; else echo "задана неверная длина пароля " >&2; exit 1; fi ;;
    h) echo -e "\n -l количество символов в пароле
\n -n количество паролей
\n по дефолту генерируется 5 паролей длиной 10 символов
\n создал это все Алексей zipik"; exit 0;;
    *) echo "Try '-h' for more information." >&2; exit 1;;
  esac
done
for (( i=0; i < $number; i++ ))
do
< /dev/urandom tr -dc [:alnum:] | head -c$long; echo
done
exit 0