﻿using OfficeOpenXml;
using QuanLyDaiLy.Scripts;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDaiLy.Forms
{
    public partial class BaoCaoCongNo : Form
    {
        public BaoCaoCongNo()
        {
            InitializeComponent();
        }

        private void BaoCaoCongNo_Load(object sender, EventArgs e)
        {
            //
            int month = dateTimePicker1.Value.Month;
            int year = dateTimePicker1.Value.Year;
            //load data
            DataTable data = DataProvider.Instance.ExecuteQuery("USP_GetCongNoInfo @Thang , @Nam ",new object[] {month,year});
            dataGridView1.DataSource = data;
            
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            BaoCaoCongNo_Load(sender,e);
        }

        private void dataGridView1_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void dataGridView1_ColumnDisplayIndexChanged(object sender, DataGridViewColumnEventArgs e)
        {
            
        }

        private void dataGridView1_Sorted(object sender, EventArgs e)
        {
            for (int i = 0; i < dataGridView1.Rows.Count - 1; i++)
            {
                dataGridView1.Rows[i].Cells["STT"].Value = i;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using(PhieuGhiNo phieuGhiNo = new PhieuGhiNo())
            {
                phieuGhiNo.ShowDialog();
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            DateTime currentDate = dateTimePicker1.Value;

            // Thay đổi giá trị lên 1 tháng
            DateTime newDate = currentDate.AddMonths(-1);

            // Cập nhật giá trị của DateTimePicker
            dateTimePicker1.Value = newDate;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DateTime currentDate = dateTimePicker1.Value;

            // Thay đổi giá trị lên 1 tháng
            DateTime newDate = currentDate.AddMonths(1);

            // Cập nhật giá trị của DateTimePicker
            dateTimePicker1.Value = newDate;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            DataTable dt = dataGridView1.DataSource as DataTable;
            dt.DefaultView.RowFilter =
            string.Format("MaDaiLy LIKE '{0}%' OR MaDaiLy LIKE '% {0}%' OR TenDaiLy LIKE '{0}%' OR TenDaiLy LIKE '% {0}%'", textBox1.Text);
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "Excel Files (*.xlsx)|*.xlsx|All Files (*.*)|*.*";
            saveFileDialog.FileName = "MyFile.xlsx";
            saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                string filePath = saveFileDialog.FileName;
                // Thực hiện các thao tác lưu file tại đường dẫn được chọn
                SaveExcelFile(filePath);
            }
        }

        private void SaveExcelFile(string filePath)
        {
            using (var package = new ExcelPackage())
            {
                // Tạo một worksheet mới
                var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                // Thêm tiêu đề
                for (int i = 0; i < dataGridView1.Columns.Count; i++)
                {
                    worksheet.Cells[1, i + 1].Value = dataGridView1.Columns[i].HeaderText;
                }

                // Thêm dữ liệu
                for (int i = 0; i < dataGridView1.Rows.Count; i++)
                {
                    for (int j = 0; j < dataGridView1.Columns.Count; j++)
                    {
                        worksheet.Cells[i + 2, j + 1].Value = dataGridView1[j, i].Value;
                    }
                }

                // Lưu file Excel
                var fileName = filePath;
                File.Delete(fileName);
                package.SaveAs(new FileInfo(fileName));

                MessageBox.Show("Dữ liệu đã được xuất ra Excel thành công!");
            }
        }
    }
}
