import pyodbc

cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=DESKTOP-VJ76OQV;DATABASE=Permissions;TRUSTED_CONNECTION=YES;UID=DESKTOP-VJ76OQV\esala')
cursor = cnxn.cursor()


if __name__ == '__main__':
    cursor.execute("select UserId, Name from Users")
    row = cursor.fetchone()
    print(row)