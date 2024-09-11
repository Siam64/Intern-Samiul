namespace CMSS.ViewModel
{
    public class CustomerInfoVM
    {
        public int ID { get; set; }
        public Guid CustomerID { get; set; }
        public string Name { get; set; }
        public string Number { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Note { get; set; }
        public string city { get; set; }

        //for admin
        public DateTime CreateAt { get; set; }
        public Guid CreateBy { get; set; }
        public DateTime UpdateAt { get; set; }
        public Guid UpdateBy { get; set; }
    }


    public class MultiModelVM
    {
        public CustomerInfoVM CustomerInfo { get; set; }
        public ParcelInfoVM ParcelInfo { get; set; }


    }
}
