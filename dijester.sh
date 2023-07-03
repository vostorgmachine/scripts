#!/bin/bash

# ==================================================

# 1. Проработать механизм защиты от срабатывания скрипта не в той директории

# 2. В Auto_fill добавить функцию добавления пробела в выписку (быть может,
# стоит переписать его целиком?)

# 3. В перспективе необходимо добавить фyнкцию выбора тем, которые должны
# образовать дайджест.

# ==================================================

# Скопировать все .md в отдельную директорию для дальнейшей обработки 

mkdir ../source/dijest

find . -type f -name "*.md" | xargs cp -vt ../source/dijest

cd ../source/dijest/

echo ""
pwd
echo ""

mkdir stats order repression war economy other

# # grep-секция

grep -rlP '^(?=.*Теги)(?=.*Статистика)' | xargs mv -vt stats/
grep -rlP '^(?=.*Теги)(?=.*Закон)' | xargs mv -vt order/
grep -rlP '^(?=.*Теги)(?=.*Репресс)' | xargs mv -vt repression/
grep -rlP '^(?=.*Теги)(?=.*Войн)' | xargs mv -vt war/
grep -rlP '^(?=.*Теги)(?=.*Экономи)' | xargs mv -vt economy/

cd stats/
echo "# Статистика" >> stats.md
echo "" >> stats.md
cat *.md >> stats.md
echo "" >> stats.md
echo "-----" >> stats.md
echo "" >> stats.md
cd ../

cd order/
echo "# Закон" >> order.md
echo "" >> order.md
cat *.md >> order.md
echo "" >> order.md
echo "-----" >> order.md
echo "" >> order.md
cd ../

cd repression
echo "# Репрессии" >> repression.md
echo "" >> repression.md
cat *.md >> repression.md
echo "" >> repression.md
echo "-----" >> repression.md
echo "" >> repression.md
cd ../

cd war
echo "# Война" >> war.md
echo "" >> war.md
cat *.md >> war.md
echo "" >> war.md
echo "-----" >> war.md
echo "" >> war.md
cd ../

cd economy
echo "# Экономика" >> economy.md
echo "" >> economy.md
cat *.md >> economy.md
echo "" >> economy.md
echo "-----" >> economy.md
echo "" >> economy.md
cd ../

mv *.md other/
cd other/
echo "# Прочее" >> other.md
echo "" >> other.md
cat *.md >> other.md
cd ../

echo ""
pwd
echo ""

cat stats/stats.md >> dijest.md
cat order/order.md >> dijest.md
cat repression/repression.md >> dijest.md
cat war/war.md >> dijest.md
cat economy/economy.md >> dijest.md
cat other/other.md >> dijest.md

echo ""
echo "done!"
echo ""

