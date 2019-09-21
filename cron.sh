# crontab -e
# minutos (0-59), horas (0-23), día del mes (1-31), mes (1-12) y día de la semana (0-6, 0=domingo)
# todos los meses el día 1ero a las 2am
0 2 1 * * rsync -avz /ParaRespaldar/Comun /Respaldo/mensual
# todos los meses durante el día 7,14,21 y 28 a las 3am
0 3 7,14,21,28 * * rsync -avz /ParaRespaldar/Comun /Respaldo/semanal
