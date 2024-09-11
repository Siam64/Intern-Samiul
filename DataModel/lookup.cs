using System.ComponentModel.DataAnnotations;

namespace CMSS.DataModel
{
    public class lookup
    {
        [Key]
        public int Id { get; set; }
        public string Type { get; set; }
        public string Value { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public int Serial { get; set; }

        // admin use
        public DateTime CreateAt { get; set; }
        public Guid CreateBy { get; set; }
        public DateTime UpdateAt { get; set; }
        public Guid UpdateBy { get; set; }
    }
}
