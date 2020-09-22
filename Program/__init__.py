# pcortes@gmail.com / hola123 / admin
# lmateus@hotmail.com /test098 / sin permisos
from Program.dbConnection import check_permissions

if __name__ == '__main__':
    server = 'DESKTOP-VJ76OQV'
    db = 'Permissions'
    userID = 'DESKTOP-VJ76OQV\esala'
    email = "lmateus@hotmail.com"
    password = "test098"
    check_permissions(email, password, server, db, userID)