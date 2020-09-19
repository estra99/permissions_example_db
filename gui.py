import PySimpleGUI as sg
import sys

# Setting sg variables
sg.theme('light grey 6')
screen = (1000,800)
my_font = ('Arial', 14)


# ---------------- Functions for layout definition ----------------- #
def input_info(label, text_key, input_key, input_size=(45,1)):
    return [sg.Text(label, key=text_key), sg.Input(key=input_key, size=input_size)]

def col(pLayout, pKey):
    return sg.Column(pLayout, size=screen, key=pKey, visible=False)

# ---------------------------- Layouts ----------------------------- #
login_layout = [input_info('Username', 'lab_username','user_login'),
                [sg.Text('Password', key='lab_password'), sg.Input(key='password_login', password_char='*'), sg.Button('Login', key='blogin')]]

shop_layout = [[]]

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