import PySimpleGUI as sg
import sys
import Program.dbConnection as db

# Setting sg variables
sg.theme('light grey 6')
screen = (600,400)
my_font = ('Arial', 14)

permission_codes = {1110:['lab_amount'], 1120:['cbox_enabled', 'btn_save'], 1130:['btn_delete'], 1140:['btn_transactions']}


# ---------------- Functions for layout definition ----------------- #
def input_info(label, text_key, input_key, input_size=(45,1)):
    return [sg.Text(label, key=text_key), sg.Input(key=input_key, size=input_size)]

# ---------------------------- Layouts ----------------------------- #
login_layout = [input_info('Username', 'lab_username','user_login'),
                [sg.Text('Password', key='lab_password'), sg.Input(key='password_login', password_char='*'), sg.Button('Login', key='login_button')]]

shop_layout = [[sg.Text('Nombre de sucursal', key='lab_shop_name'), sg.Text('Saldo: $', key='lab_balamce'), sg.Text('123456', key='lab_amount', visible=False)],
                [sg.Checkbox('Habilitada', key='cbox_enabled', visible=False)],
                [sg.Button('Salvar', key='btn_save', visible=False), sg.Button('Eliminar', key='btn_delete', visible=False), sg.Button('Transacciones', key='btn_transactions', visible=False)]]

main_layout = [[sg.Column(login_layout, size=screen, key='login_frame'),
                sg.Column(shop_layout, size=screen, key='shop_frame', visible=False)]]

# ------------------------ Window definition ----------------------- #
window = sg.Window('', main_layout, size=screen, font=my_font)

# -------------------------- Main Method --------------------------- #
if __name__ == '__main__':
    sys.dont_write_bytecode = True
    while True:
        event, values = window.read()
        if event == None:
            break
        if event == 'login_button':

            permissions = db.gcheck_permissions(values['user_login'], values['password_login'], 1,1,1)

            if len(permissions) > 0 and permissions[0]== -1 :
                sg.popup('El usuario o la contraseña tienen un error')
            else:
                window['login_frame'].update(visible=False)
                for code in permissions:
                    for element in permission_codes[code]:
                        window[element].update(visible=True)
                window['shop_frame'].update(visible=True)