#Fuente: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/using_selinux/index 

# busca en audit.log los registro generados por selinux para corregir
#all denials	
ausearch -m avc
#denials for that today	
ausearch -m avc -ts today
#denials from the last 10 minutes	
ausearch -m avc -ts recent
# busca en un servicio particular
ausearch -m avc -c httpd
ausearch -m avc -c smbd

# cambio del contexto del directorio `files` para que pueda ser escrito por el proceso apache
# al usar chcon se realizar cambios de prueba, porque no son persistentes
chcon -R -t httpd_sys_content_rw_t files
chcon -R -t httpd_sys_content_t index.html

# lista los contextos, se pueden sacar los ejemplos de aquí
semanage fcontext -l
# para crear cambios persistentes, debo usar semanage
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/ventas1.cl/public_html/sites/default/files(/.*)?"
# copia el contexto de otro path
semanage fcontext -a -e /var/www /var/test_www
# lo anterior agrego eso al registro, para aplicar debo usar restorecon
restorecon -RFvv /var/www
# puedo revisar las reglas aplicadas al dir /var/www buscando con grep
semanage fcontext -l | grep -i /var/www
# puedo eliminar una regla con
semanage fcontext -d "/var/www/ventas1.cl/public_html/sites/default/files(/.*)?"

# lista con políticas lista para activar
getsebool -a
setsebool -P httpd_can_network_connect on
