# correr como el usuario que ejecuta gnome
[gnomeuser@localhost]$ xhost +
[gnomeuser@localhost]$ sudo su - otheruser

# correr como el usuario que posee la app
[otheruser@localhost]$ export DISPLAY=:0 
# también puedo ejecutar el export desde un archivo
#[otheruser@localhost]$ source exportDisplay.sh

[otheruser@localhost]$ ./run-mi-app.sh
# una vez terminada de utilizar salgo
[otheruser@localhost]$ exit

# y quito los permisos
[gnomeuser@localhost]$ xhost -

