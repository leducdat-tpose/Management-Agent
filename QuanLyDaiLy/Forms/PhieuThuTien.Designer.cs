﻿namespace QuanLyDaiLy.Forms
{
    partial class PhieuThuTien
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PhieuThuTien));
            this.dtbNTT = new System.Windows.Forms.DateTimePicker();
            this.btnInsertPTT = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lblSoPhieuThu = new System.Windows.Forms.Label();
            this.tbxSTT = new System.Windows.Forms.TextBox();
            this.tbxSPT = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbMDL = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // dtbNTT
            // 
            this.dtbNTT.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtbNTT.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtbNTT.Location = new System.Drawing.Point(189, 181);
            this.dtbNTT.Name = "dtbNTT";
            this.dtbNTT.Size = new System.Drawing.Size(204, 28);
            this.dtbNTT.TabIndex = 97;
            // 
            // btnInsertPTT
            // 
            this.btnInsertPTT.Font = new System.Drawing.Font("Times New Roman", 13.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInsertPTT.Location = new System.Drawing.Point(294, 289);
            this.btnInsertPTT.Name = "btnInsertPTT";
            this.btnInsertPTT.Size = new System.Drawing.Size(258, 69);
            this.btnInsertPTT.TabIndex = 96;
            this.btnInsertPTT.Text = "Thêm Phiếu Thu";
            this.btnInsertPTT.UseVisualStyleBackColor = true;
            this.btnInsertPTT.Click += new System.EventHandler(this.btnInsertPTT_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 13.2F);
            this.label1.Location = new System.Drawing.Point(452, 101);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(108, 25);
            this.label1.TabIndex = 92;
            this.label1.Text = "Mã Đại Lý";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 13.2F);
            this.label4.Location = new System.Drawing.Point(452, 181);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(121, 25);
            this.label4.TabIndex = 93;
            this.label4.Text = "Số Tiền Thu";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 13.2F);
            this.label3.Location = new System.Drawing.Point(35, 181);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(145, 25);
            this.label3.TabIndex = 94;
            this.label3.Text = "Ngày Thu Tiền";
            // 
            // lblSoPhieuThu
            // 
            this.lblSoPhieuThu.AutoSize = true;
            this.lblSoPhieuThu.BackColor = System.Drawing.Color.Transparent;
            this.lblSoPhieuThu.Font = new System.Drawing.Font("Times New Roman", 13.2F);
            this.lblSoPhieuThu.Location = new System.Drawing.Point(35, 101);
            this.lblSoPhieuThu.Name = "lblSoPhieuThu";
            this.lblSoPhieuThu.Size = new System.Drawing.Size(131, 25);
            this.lblSoPhieuThu.TabIndex = 95;
            this.lblSoPhieuThu.Text = "Số Phiếu Thu";
            // 
            // tbxSTT
            // 
            this.tbxSTT.Font = new System.Drawing.Font("Times New Roman", 13.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbxSTT.Location = new System.Drawing.Point(585, 181);
            this.tbxSTT.Name = "tbxSTT";
            this.tbxSTT.Size = new System.Drawing.Size(204, 33);
            this.tbxSTT.TabIndex = 90;
            // 
            // tbxSPT
            // 
            this.tbxSPT.Font = new System.Drawing.Font("Times New Roman", 13.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbxSPT.Location = new System.Drawing.Point(189, 95);
            this.tbxSPT.Name = "tbxSPT";
            this.tbxSPT.Size = new System.Drawing.Size(204, 33);
            this.tbxSPT.TabIndex = 91;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 16F, System.Drawing.FontStyle.Bold);
            this.label2.Location = new System.Drawing.Point(320, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(178, 31);
            this.label2.TabIndex = 88;
            this.label2.Text = "Phiếu thu tiền";
            // 
            // cbMDL
            // 
            this.cbMDL.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbMDL.FormattingEnabled = true;
            this.cbMDL.Location = new System.Drawing.Point(585, 97);
            this.cbMDL.Name = "cbMDL";
            this.cbMDL.Size = new System.Drawing.Size(204, 34);
            this.cbMDL.TabIndex = 142;
            // 
            // PhieuThuTien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(824, 382);
            this.Controls.Add(this.cbMDL);
            this.Controls.Add(this.dtbNTT);
            this.Controls.Add(this.btnInsertPTT);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lblSoPhieuThu);
            this.Controls.Add(this.tbxSTT);
            this.Controls.Add(this.tbxSPT);
            this.Controls.Add(this.label2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(842, 429);
            this.MinimumSize = new System.Drawing.Size(842, 429);
            this.Name = "PhieuThuTien";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "PhieuThuTien";
            this.Load += new System.EventHandler(this.PhieuThuTien_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtbNTT;
        private System.Windows.Forms.Button btnInsertPTT;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblSoPhieuThu;
        private System.Windows.Forms.TextBox tbxSTT;
        private System.Windows.Forms.TextBox tbxSPT;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbMDL;
    }
}