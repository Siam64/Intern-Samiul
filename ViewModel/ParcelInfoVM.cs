namespace CMSS.ViewModel
{
    public class ParcelInfoVM
    {
        public int ID { get; set; }
        public Guid ParcelID { get; set; }
        public string ParcelType { get; set; }
        public double Weight { get; set; }
        public double Price { get; set; }
        public string Note { get; set; }
        public DateTime DelivaryDate { get; set; }
        public Guid SenderID { get; set; }
        public Guid ReceiverID { get; set; }

        public DateTime CreateAt { get; set; }
        public Guid CreateBy { get; set; }
        public DateTime UpdateAt { get; set; }
        public Guid UpdateBy { get; set; }
    }
}
