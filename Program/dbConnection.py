import pyodbc
import hashlib


def connect_db(server, db, userID):
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';DATABASE=' + db + ';TRUSTED_CONNECTION=YES;UID=' + userID)
    cursor = cnxn.cursor()
    return cursor


def encrypt_string(hash_string):
    sha_signature = hashlib.sha256(hash_string.encode()).hexdigest()
    return sha_signature


def check_permissions(email, password, server, db, userID):
    cursor = connect_db(server, db, userID)
    password_sha = encrypt_string(password)
    cursor.execute('EXEC sp_GetUserPermission @email = ?, @password = ?', email, password_sha)
    rows = cursor.fetchall()
    cursor.close()
    if len(rows) == 0:
        return -1
    permissions = []
    for permission in rows:
        permissions.append(permission[1])
    return permissions



