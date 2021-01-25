import sys
from PyQt5.QtCore import *
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox, QTableWidgetItem, QHeaderView
from MainWindow import Ui_MainWindow
import pymysql

class MyMainWindow(QMainWindow, Ui_MainWindow):

    def __init__(self):
        super(MyMainWindow, self).__init__()
        self.setupUi(self)

    def btn_LogIn_onClicked(self):
        conn = pymysql.connect(host='localhost', port=3306, user='root', password='123456',
                               db='warehousemanagement-pyqt5', charset='utf8')
        username = self.le_UserName.text()
        password = self.le_PassWord.text()
        cur = conn.cursor()
        sql = "select * from `user` where username='" + username + "' and password = '" + password + "' and `identity` = '1'"
        cur.execute(sql)
        data = cur.fetchone()
        if data[1] == self.le_PassWord.text():
            QMessageBox().information(None, '提示', '登录成功！', QMessageBox.Yes)
            self.stackedWidget.setCurrentIndex(1)
        else:
            QMessageBox().information(None, '提示', '用户或密码或权限错误！', QMessageBox.No)
            self.stackedWidget.setCurrentIndex(0)

        cur.close()
        conn.close()


    def btn_search1_onClicked(self):
        self.stackedWidget_2.setCurrentIndex(0)
        conn = pymysql.connect(host='localhost', port=3306, user='root', password='123456',
                               db='warehousemanagement-pyqt5', charset='utf8')
        cur = conn.cursor()
        sql = "select p.p_no, p.p_name, st.i_sum, p.p_price, su.s_name from partslist p INNER join `storage` st ON p.p_no = st.p_no INNER join supplier su on st.s_no = su.s_no"
        cur.execute(sql)
        data = cur.fetchall()
        row = cur.rowcount
        vol = len(data[0])
        self.tableWidget.setRowCount(row)
        self.tableWidget.setColumnCount(vol)
        # 设置表格头为伸缩模式
        self.tableWidget.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.tableWidget.setHorizontalHeaderLabels(['零件编号', '零件名称', '入库数量', '零件价格', '供应商名字'])
        for i in range(row):
            for j in range(vol):
                newItem = QTableWidgetItem(str(data[i][j]))
                newItem.setTextAlignment(Qt.AlignHCenter | Qt.AlignVCenter)
                self.tableWidget.setItem(i, j, newItem)
        cur.close()
        conn.close()

    def btn_search2_onClicked(self):
        self.stackedWidget_2.setCurrentIndex(1)
        conn = pymysql.connect(host='localhost', port=3306, user='root', password='123456',
                               db='warehousemanagement-pyqt5', charset='utf8')
        cur = conn.cursor()
        sql = "select p.p_no, p.p_name, de.e_sum, p.p_price, dt.d_name from partslist p INNER join `delivery` de ON p.p_no = de.p_no INNER join department dt on de.d_no = dt.d_no"
        cur.execute(sql)
        data = cur.fetchall()
        row = cur.rowcount
        vol = len(data[0])
        self.tableWidget_2.setRowCount(row)
        self.tableWidget_2.setColumnCount(vol)
        # 设置表格头为伸缩模式
        self.tableWidget_2.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.tableWidget_2.setHorizontalHeaderLabels(['零件编号', '零件名称', '出库数量', '零件价格', '领取部门'])
        for i in range(row):
            for j in range(vol):
                newItem = QTableWidgetItem(str(data[i][j]))
                newItem.setTextAlignment(Qt.AlignHCenter | Qt.AlignVCenter)
                self.tableWidget_2.setItem(i, j, newItem)
        cur.close()
        conn.close()

    def btn_search3_onClicked(self):
        self.stackedWidget_2.setCurrentIndex(2)
        conn = pymysql.connect(host='localhost', port=3306, user='root', password='123456',
                               db='warehousemanagement-pyqt5', charset='utf8')
        cur = conn.cursor()
        sql = "select s.s_sum, p.p_no, p.p_name, p.p_model, p.p_price from partslist p INNER join `stock` s ON p.p_no = s.p_no "
        cur.execute(sql)
        data = cur.fetchall()
        row = cur.rowcount
        vol = len(data[0])
        self.tableWidget_3.setRowCount(row)
        self.tableWidget_3.setColumnCount(vol)
        # 设置表格头为伸缩模式
        self.tableWidget_3.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.tableWidget_3.setHorizontalHeaderLabels(['库存总量', '零件编号', '零件名称', '零件规格', '零件价格'])
        for i in range(row):
            for j in range(vol):
                newItem = QTableWidgetItem(str(data[i][j]))
                newItem.setTextAlignment(Qt.AlignHCenter | Qt.AlignVCenter)
                self.tableWidget_3.setItem(i, j, newItem)
        cur.close()
        conn.close()


if __name__=='__main__':
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)
    win = MyMainWindow()
    win.show()
    sys.exit(app.exec())