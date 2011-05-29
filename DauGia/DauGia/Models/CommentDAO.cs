using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DauGia.Models
{
    public class CommentDAO
    {
        public static DauGiaEntities dg = new DauGiaEntities();
        public static List<Comment> LayDSComment()
        {
            return dg.Comments.ToList();
        }
        public static List<Comment> LayDSCommentTheoMaSanPham(int maSanPham)
        {
            List<Comment> kq = new List<Comment>();
            var query = dg.Comments.Where(n => n.MaSanPham == maSanPham);
            foreach (Comment c in query)
                kq.Add((Comment)c);
            return kq;
        }
    }
}