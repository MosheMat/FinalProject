//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class GameResult
    {
        public int game_id { get; set; }
        public int user_id { get; set; }
        public System.DateTime game_time { get; set; }
        public int game_duration { get; set; }
        public int moves_num { get; set; }
    
        public virtual GameResult GameResults1 { get; set; }
        public virtual GameResult GameResult1 { get; set; }
        public virtual GameResult GameResults11 { get; set; }
        public virtual GameResult GameResult2 { get; set; }
        public virtual User User { get; set; }
    }
}
