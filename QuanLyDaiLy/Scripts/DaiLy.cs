﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDaiLy
{
    public class DaiLy
    {
        public string MaDaiLy {  get; set; }
        public string TenDaiLy { get; set; }
        public string LoaiDaiLy { get; set; }
        public string DienThoai { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string Quan { get; set; }
        public string NgayTiepNhan { get; set; }
        public string TongNo { get; set; }
        public DaiLy(string MaDaiLy , string TenDaiLy, string LoaiDaiLy, string DienThoai, string DiaChi, string Email, string Quan, string NgayTiepNhan, string TongNo)
        {
            this.MaDaiLy = MaDaiLy;
            this.TenDaiLy = TenDaiLy;
            this.LoaiDaiLy = LoaiDaiLy;
            this.Quan = Quan;
            this.DienThoai = DienThoai;
            this.Email = Email;
            this.DiaChi = DiaChi;
            this.NgayTiepNhan = NgayTiepNhan;
            this.TongNo = TongNo;
        }
        public DaiLy(DataRow row)
        {
            this.MaDaiLy = row["MaDaiLy"].ToString();
            this.TenDaiLy = row["TenDaiLy"].ToString();
            this.LoaiDaiLy = row["MaLoaiDaiLy"].ToString();
            this.Quan = row["MaQuan"].ToString();
            this.DienThoai = row["DienThoai"].ToString();
            this.Email = row["Email"].ToString();
            this.DiaChi = row["DiaChi"].ToString(); 
            this.NgayTiepNhan = row["NgayTiepNhan"].ToString();
            this.TongNo = row["TongNo"].ToString();
        }
    }
}
