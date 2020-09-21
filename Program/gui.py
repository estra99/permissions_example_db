import PySimpleGUI as sg
import sys

# Setting sg variables
sg.theme('light grey 6')
screen = (600,400)
my_font = ('Arial', 14)


# ---------------- Functions for layout definition ----------------- #
def input_info(label, text_key, input_key, input_size=(45,1)):
    return [sg.Text(label, key=text_key), sg.Input(key=input_key, size=input_size)]

# ---------------------------- Layouts ----------------------------- #
login_layout = [input_info('Username', 'lab_username','user_login'),
                [sg.Text('Password', key='lab_password'), sg.Input(key='password_login', password_char='*'), sg.Button('Login', key='login_button')]]

shop_layout = [[sg.Text('Nombre de sucursal', key='lab_shop_name'), sg.Text('Saldo: $', key='lab_balamce'), sg.Text('123456', key='lab_amount')],
                [sg.Checkbox('Habilitada', key='cbox_enabled')],
                [sg.Button('Salvar', key='btn_save'), sg.Button('Eliminar', key='btn_delete'), sg.Button('Transacciones', key='btn_transactions')]]

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
            window['login_frame'].update(visible=False)
            window['shop_frame'].update(visible=True)