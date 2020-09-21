import PySimpleGUI as sg
import sys

# Setting sg variables
sg.theme('light grey 6')
screen = (500, 200)
my_font = ('Times', 16)


# ---------------- Functions for layout definition ----------------- #
def input_info(label, text_key, input_key, input_size = (40, 1)):
    return [sg.Text(label, key = text_key), sg.Input(key = input_key, size = input_size)]


# ---------------------------- Layouts ----------------------------- #
login_layout = [input_info('Username', 'lab_username', 'user_login'),
                [sg.Text('Password', key='lab_password'), sg.Input(key='password_login', password_char='*'),
                 sg.Button('Login', key='login_button')]]

shop_layout = [[]]

main_layout = [[sg.Column(login_layout, size=screen, key='login_frame'),
                sg.Column(shop_layout, size=screen, key='shop_frame', visible=False)]]

# ------------------------ Window definition ----------------------- #
window = sg.Window('', main_layout, size = screen, font = my_font)

# -------------------------- Main Method --------------------------- #
if __name__ == '__main__':
    sys.dont_write_bytecode = True
    while True:
        event, values = window.read()
        if event == None:
            break
        if event == 'login_button':
            print("Login function is called here")
