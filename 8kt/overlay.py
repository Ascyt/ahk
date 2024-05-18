import sys
from PyQt5.QtCore import Qt, QRectF, QTimer
from PyQt5.QtGui import QPainter, QColor, QFont, QFontMetrics
from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtSvg import QSvgRenderer
import time

posX = 0.99
posY = 0.95

class OverlayDefault(QWidget):
    def __init__(self, svg_path):
        super().__init__()
        self.svg_path = svg_path
        self.initUI()

    def initUI(self):
        # Load the SVG
        self.renderer = QSvgRenderer(self.svg_path)

        # Set the window to be transparent and frameless
        self.setWindowFlags(Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool | Qt.WindowTransparentForInput)
        self.setAttribute(Qt.WA_TranslucentBackground)

        # Resize the window to the size of the SVG
        svg_size = self.renderer.defaultSize() / 4
        self.resize(svg_size)

        # Center the window on the screen
        screen_geometry = QApplication.desktop().screenGeometry()
        x = int((screen_geometry.width() - self.width()) * posX)
        y = int((screen_geometry.height() - self.height()) * posY)
        self.move(x, y)

    def paintEvent(self, event):
        painter = QPainter(self)
        self.renderer.render(painter, QRectF(0, 0, self.width(), self.height()))

class OverlayKey(QWidget):
    def __init__(self, svg_path, keyIndex):
        super().__init__()
        self.svg_path = svg_path
        self.initUI()
        self.visible_flag = True
        self.old_contents = ''
        self.keyIndex = keyIndex

        # Set up a timer to toggle the visibility
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.toggleVisibility)
        self.timer.start(1)  # Toggle every 1 millisecond

    def initUI(self):
        # Load the SVG
        self.renderer = QSvgRenderer(self.svg_path)

        # Set the window to be transparent and frameless
        self.setWindowFlags(Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool | Qt.WindowTransparentForInput)
        self.setAttribute(Qt.WA_TranslucentBackground)

        # Resize the window to the size of the SVG
        svg_size = self.renderer.defaultSize() / 4
        self.resize(svg_size)

        # Center the window on the screen
        screen_geometry = QApplication.desktop().screenGeometry()
        x = int((screen_geometry.width() - self.width()) * posX)
        y = int((screen_geometry.height() - self.height()) * posY)
        self.move(x, y)

    def paintEvent(self, event):
        painter = QPainter(self)
        if self.visible_flag:
            self.renderer.render(painter, QRectF(0, 0, self.width(), self.height()))
        else:
            painter.fillRect(self.rect(), QColor(0, 0, 0, 0))  # Clear with transparent color

    def toggleVisibility(self):
        with open('./8kt_pressed.txt', 'r') as file:
            contents = file.read()

        if contents == self.old_contents:
            return
        
        self.old_contents = contents
        self.visible_flag = len(contents) >= 5 and contents[self.keyIndex] == '1'    
    
        self.update()  # Trigger a repaint

class OverlayText(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI(posX, posY)
        self.old_contents = ''
        self.text = ''

        # Set up a timer to toggle the visibility
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.toggleVisibility)
        self.timer.start(1)  # Toggle every 1 millisecond

    def initUI(self, posX, posY):
        # Set the window to be transparent and frameless
        self.setWindowFlags(Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool | Qt.WindowTransparentForInput)
        self.setAttribute(Qt.WA_TranslucentBackground)

        # Set the font and calculate the size of the text
        self.font = QFont('Courier New', 12)
        self.font.setLetterSpacing(QFont.AbsoluteSpacing, 10)
        self.font_metrics = QFontMetrics(self.font)
        text_size = self.font_metrics.size(0, '000')
        self.resize(text_size.width(), text_size.height())

        # Center the window on the screen
        screen_geometry = QApplication.desktop().screenGeometry()
        x = int((screen_geometry.width() - (self.width() * 1.25)) * posX)
        y = int((screen_geometry.height() - self.height()) * posY)
        self.move(x, y)

    def paintEvent(self, event):
        painter = QPainter(self)

        painter.fillRect(self.rect(), QColor(0, 0, 0, 0))  # Clear with transparent color

        painter.setFont(self.font)
        painter.setPen(QColor(255, 255, 255))  # White color for the text
        painter.drawText(self.rect(), Qt.AlignCenter, self.text)
            

    def getTextContents(self, contents):
        mapping = {
            '00000': ' \'-',
            '00001': '🞀"_',
            '00010': 'tah',
            '00011': 'TAH',
            '00100': 'esr',
            '00101': 'ESR',
            '00110': 'ing',
            '00111': 'ING',
            '01000': 'uoy',
            '01001': 'UOY',
            '01010': 'mfb',
            '01011': 'MFB',
            '01100': 'dlp',
            '01101': 'DLP',
            '01110': 'ckx',
            '01111': 'CKX',
            '10000': 'wvj',
            '10001': 'WVJ',
            '10010': 'qz/',
            '10011': 'QZ?',
            '10100': '.,;',
            '10101': '<>:',
            '10110': '123',
            '10111': '!@#',
            '11000': '456',
            '11001': '$%^',
            '11010': '789',
            '11011': '{}&',
            '11100': '()0',
            '11101': '[]*',
            '11110': '=\\`',
            '11111': '+|~'
        }
        
        return mapping[contents]

    def toggleVisibility(self):
        with open('./8kt_pressed.txt', 'r') as file:
            contents = file.read()

        if contents == self.old_contents:
            return
        
        self.old_contents = contents
        
        if len(contents) < 5:
            return

        self.text = self.getTextContents(contents)
    
        self.update()  # Trigger a repaint

if __name__ == '__main__':
    app = QApplication(sys.argv)
    svg_path = 'assets/default.svg'  
    default_overlay = OverlayDefault(svg_path)
    default_overlay.show()

    time.sleep(0.01)

    keys = ['D', 'C', 'B', 'A', 'S']
    key_overlays = []

    for i in range(len(keys)):
        key_svg_path = f'assets/{keys[i]}.svg'  
        key_overlays.append(OverlayKey(key_svg_path + '', i + 0))
        key_overlays[i].show()

    time.sleep(0.01)

    text_overlay = OverlayText()
    text_overlay.show()

    sys.exit(app.exec_())