﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SportApp.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SportAppBDEntities : DbContext
    {
        private static SportAppBDEntities _context;
        public SportAppBDEntities()
            : base("name=SportAppBDEntities")
        {
        }

        public static SportAppBDEntities GetContext()
        {
            if(_context == null)
            {
                _context = new SportAppBDEntities();
            }
            return _context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<UserGender> UserGender { get; set; }
        public virtual DbSet<UserRole> UserRole { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}
