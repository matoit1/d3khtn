using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class PhuHuynhDAO
    {
        public List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from ph in db.PhuHuynhs where ph.MaPhuHuynh == maphuhuynh select new PhuHuynhDTO() { MaPhuHuynh = ph.MaPhuHuynh, TenCha = ph.TenCha, NgheNghiepCha = ph.NgheNhiepCha, TuoiCha = ph.TuoiCha, SdtCha = ph.SdtCha, DiaChiCoQuanCha = ph.DiaChiCoQuanCha, TenMe = ph.TenMe, NgheNghiepMe = ph.NgheNghiepMe, SdtMe = ph.SdtMe, TuoiMe = ph.TuoiMe, DiaChiCoQuanMe = ph.DiaChiCoQuanMe };

            return query.ToList<PhuHuynhDTO>();
        }
        public int ThemPhuHuynh(PhuHuynhDTO phuhuynh)
        {//tra ve mã phụ huynh
            int kq;
            try
            {
                QLNTDataContext db = new QLNTDataContext();

                PhuHuynh ph = new PhuHuynh();
                ph.TenCha = phuhuynh.TenCha;
                ph.NgheNhiepCha = phuhuynh.NgheNghiepCha;
                ph.TuoiCha = phuhuynh.TuoiCha;
                ph.SdtCha = phuhuynh.SdtCha;
                ph.DiaChiCoQuanCha = phuhuynh.DiaChiCoQuanCha;
                ph.TenMe = phuhuynh.TenMe;
                ph.NgheNghiepMe = phuhuynh.NgheNghiepMe;
                ph.TuoiMe = phuhuynh.TuoiMe;
                ph.SdtMe = phuhuynh.SdtMe;
                ph.DiaChiCoQuanMe = phuhuynh.DiaChiCoQuanMe;

                db.PhuHuynhs.InsertOnSubmit(ph);
                db.SubmitChanges();
                //var maxid = (from vd in db.PhuHuynhs
                //             orderby vd.MaPhuHuynh
                //             select vd).Last();
                kq = ph.MaPhuHuynh;
            }
            catch
            {
                kq =-1;
            }
            return kq;
        }
        public bool CapNhapPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.PhuHuynhs.Single(ph => ph.MaPhuHuynh == phuhuynh.MaPhuHuynh);
                query.TenCha = phuhuynh.TenCha;
                query.NgheNhiepCha = phuhuynh.NgheNghiepCha;
                query.TuoiCha = phuhuynh.TuoiCha;
                query.SdtCha = phuhuynh.SdtCha;
                query.DiaChiCoQuanCha = phuhuynh.DiaChiCoQuanCha;
                query.TenMe = phuhuynh.TenMe;
                query.NgheNghiepMe = phuhuynh.NgheNghiepMe;
                query.TuoiMe = phuhuynh.TuoiMe;
                query.SdtMe = phuhuynh.SdtMe;
                query.DiaChiCoQuanMe = phuhuynh.DiaChiCoQuanMe;
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }

        public bool XoaPhuHuynh(int maPH)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.PhuHuynhs.Single(k => k.MaPhuHuynh == maPH);
                db.PhuHuynhs.DeleteOnSubmit(query);
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
