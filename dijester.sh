#!/bin/bash

# ==================================================

# 1. Проработать механизм защиты от срабатывания скрипта не в той директории

# 2. В Auto_fill добавить функцию добавления пробела в выписку (быть может,
# стоит переписать его целиком?)

# 3. В перспективе необходимо добавить фкнцию выбора тем, которые должны
# образовать дайджест.

# ==================================================

# Скопировать все .md в отдельную директорию для дальнейшей обработки 

find . -type f -name "*.md" | xargs cp -vt ../source/dijest

cd ../source/dijest/

echo ""
pwd
echo ""

mkdir order repression war economy other

# # grep-секция

# # ==================================================
# # На данный момент cat "склеивает выписки не корректно. Необходимо проработать
# # переход из исходной директории в рабочую.
# # ==================================================

grep -rlP '^(?=.*Теги)(?=.*Закон)' | xargs mv -vt order/
grep -rlP '^(?=.*Теги)(?=.*Репресс)' | xargs mv -vt repression/
grep -rlP '^(?=.*Теги)(?=.*Войн)' | xargs mv -vt war/
grep -rlP '^(?=.*Теги)(?=.*Экономи)' | xargs mv -vt economy/

cd order/
echo "# Закон" >> order.md
echo "" >> order.md
cat *.md >> order.md
echo "" >> order.md
echo "-----" >> order.md
cd ../

cd repression
echo "# Репрессии" >> repression.md
echo "" >> repression.md
cat *.md >> repression.md
echo "" >> repression.md
echo "-----" >> repression.md
cd ../

cd war
echo "# Война" >> war.md
echo "" >> war.md
cat *.md >> war.md
echo "" >> war.md
echo "-----" >> war.md
cd ../

cd economy
echo "# Экономика" >> economy.md
echo "" >> economy.md
cat *.md >> economy.md
echo "" >> economy.md
echo "-----" >> economy.md
cd ../

mv *.md other/

echo ""
echo "done!"
echo ""

