# cambio del contexto del directorio `files` para que pueda ser escrito por el proceso apache
# al usar chcon se realizar cambios de prueba, porque no son persistentes
sudo chcon -R -t httpd_sys_content_rw_t files
sudo chcon -R -t httpd_sys_content_t index.html

# para crear cambios persistentes, debo usar semanage
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/ventas1.cl/public_html/sites/default/files(/.*)?"
# lo anterior agrego eso al registro, para aplicar debo usar restorecon
restorecon -R v /var/www
# puedo revisar las reglas aplicadas al dir /var/www buscando con grep
semanage fcontext -l | grep -i /var/www
# puedo eliminar una regla con
semanage fcontext -d "/var/www/ventas1.cl/public_html/sites/default/files(/.*)?"
