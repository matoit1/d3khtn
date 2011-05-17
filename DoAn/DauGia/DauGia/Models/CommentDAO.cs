﻿using System;
using System.Collections.Generic;
using System.Linq;

namespace DauGia.Models
{
    public class CommentDAO
    {
        public static  DauGiaDataContext dg = new DauGiaDataContext();
        public static List<Comment> LayDSComment()
        {
            return dg.Comments.ToList();
        }
        public static List<Comment> LayDSCommentTheoMaSanPham(int maSanPham)
        {
            List<Comment> kq=new List<Comment> ();
            var query = dg.Comments.Where(n => n.MaSanPham == maSanPham);
            foreach (Comment c in query)
                kq.Add((Comment)c);
            return kq;
        }

    }
}
