######################################################################################
# CREATE
######################################################################################

# creacion de usuario básica
sudo useradd vp
# creación de usuario customizando el direcitorio principal y con fecha de expiración
sudo useradd --home /other-home/vp --expiredate 2019-08-31 --create-home vp

######################################################################################
# DELETE
######################################################################################

# borra el usuario vp
sudo userdel vp


######################################################################################
# UPDATE
######################################################################################

# agrega al usuario al grupo 'vboxusers' sin borrar los grupos anteriores a los que pertenecía
sudo usermod -a -G vboxusers zero
