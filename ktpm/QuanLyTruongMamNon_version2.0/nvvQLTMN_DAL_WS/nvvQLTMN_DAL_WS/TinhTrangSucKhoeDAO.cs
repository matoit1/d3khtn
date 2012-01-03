using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class TinhTrangSucKhoeDAO : StateMethod
    {
        public List<TinhTrangSucKhoeDTO> LayThongTinSucKhoe(int masuckhoe)
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from sk in db.TinhTrangSucKhoes where sk.MaTinhTrangSucKhoe == masuckhoe select new TinhTrangSucKhoeDTO() { BenhDiTruyen = sk.BenhDiTruyen, CanNang = sk.CanNang, ChieuCao = sk.ChieuCao, DaNiemMac = sk.DaNiemMac, DinhDuong = sk.DinhDuong, DuongHoHap = sk.DuongHohap, HeTimMach = sk.HeTimMach, Mat = sk.Mat, MaTinhTrangSucKhoe = sk.MaTinhTrangSucKhoe, RangHamMat = sk.RangHamMat, TaiMuiHong = sk.TaiMuiHong, TiemNgua = sk.TiemNgua };

            return query.ToList<TinhTrangSucKhoeDTO>();
        }
        public int ThemSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {//tra ve mã tình trạng sức khỏe
            int kq;
            try
            {
                QLNTDataContext db = new QLNTDataContext();

                TinhTrangSucKhoe sk = new TinhTrangSucKhoe();
                sk.BenhDiTruyen = suckhoe.BenhDiTruyen;
                sk.CanNang = suckhoe.CanNang;
                sk.ChieuCao = suckhoe.ChieuCao;
                sk.DaNiemMac = suckhoe.DaNiemMac;
                sk.DinhDuong = suckhoe.DinhDuong;
                sk.DuongHohap = suckhoe.DuongHoHap;
                sk.HeTimMach = suckhoe.HeTimMach;
                sk.Mat = suckhoe.Mat;
                sk.RangHamMat = suckhoe.RangHamMat;
                sk.TaiMuiHong = suckhoe.TaiMuiHong;
                sk.TiemNgua = suckhoe.TiemNgua;

                db.TinhTrangSucKhoes.InsertOnSubmit(sk);
                db.SubmitChanges();
                //var maxid = (from vd in db.TinhTrangSucKhoes
                //             orderby vd.MaTinhTrangSucKhoe
                //             select vd).Last();
                kq = sk.MaTinhTrangSucKhoe;

            }
            catch
            {
                kq = -1;
            }
            return kq;
        }

        public override bool CapNhap(StateClass objectClass)
        {
            bool kq = true;
            TinhTrangSucKhoeDTO suckhoe = (TinhTrangSucKhoeDTO)objectClass;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var sk = db.TinhTrangSucKhoes.Single(ph => ph.MaTinhTrangSucKhoe == suckhoe.MaTinhTrangSucKhoe);
                sk.BenhDiTruyen = suckhoe.BenhDiTruyen;
                sk.CanNang = suckhoe.CanNang;
                sk.ChieuCao = suckhoe.ChieuCao;
                sk.DaNiemMac = suckhoe.DaNiemMac;
                sk.DinhDuong = suckhoe.DinhDuong;
                sk.DuongHohap = suckhoe.DuongHoHap;
                sk.HeTimMach = suckhoe.HeTimMach;
                sk.Mat = suckhoe.Mat;
                sk.RangHamMat = suckhoe.RangHamMat;
                sk.TaiMuiHong = suckhoe.TaiMuiHong;
                sk.TiemNgua = suckhoe.TiemNgua;

                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }

        public override bool Xoa(int ma)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.TinhTrangSucKhoes.Single(k => k.MaTinhTrangSucKhoe == ma);
                db.TinhTrangSucKhoes.DeleteOnSubmit(query);
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        
        
    }
}
