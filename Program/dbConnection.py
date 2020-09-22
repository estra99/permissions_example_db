import pyodbc
import hashlib


def connect_db(server, db, userID):
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';DATABASE=' + db + ';TRUSTED_CONNECTION=YES;UID=' + userID)
    cursor = cnxn.cursor()
    return cursor

def gcheck_permissions(email, password, server, db, userID):
    return [-1]


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
        return [-1]
    permissions = []
    for permission in rows:
        permissions.append(permission[1])
    return permissions

def gcheck_permissions(email, password, server, db, userID):
    return [1110, 1130, 1140]

# cursor = gconnect_db('tcp:localhost,1433', 'quiz_dos')
# cursor.execute("SELECT @@version;") 
# row = cursor.fetchone() 
# while row: 
#     print(row[0])
#     row = cursor.fetchone()