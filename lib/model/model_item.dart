class ModelItem {
  var prepaidOperator = [
    "Airtel",
    "Airtel Express",
    "AirtelR",
    "BSNL 3G",
    "BSNL Recharge/Validity(RCV)",
    "BSNL Special(STV)",
    "BSNL TopUp",
    "Idea",
    "JIO Express",
    "MTNL Delhi",
    "MTNL Delhi Special",
    "MTNL Mumbai",
    "MTNL Mumbai Special",
    "Reliance Jio",
    "Vodafone"
  ];
  var prepaidCircle = [
    "Andhra Pradesh",
    "Assam",
    "Bihar",
    "Chennai",
    "Delhi",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Karnataka",
    "Kerala",
    "Kolkata",
    "Maharashtra",
    "Madhya Pradesh",
    "Mumbai",
    "North East",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Tamil Nadu",
    "Uttar Pradesh - East",
    "Uttar Pradesh - West",
    "West Bengal",
    "Jharkhand",
    "TRIPURA",
    "ARUNACHAL PRADESH",
    "CHHATTISGARH",
    "GOA",
    "MANIPUR",
    "MEGHALAYA",
    "MIZORAM",
    "NAGALAND",
    "SIKKIM",
    "UTTAR PRADESH",
    "UTTARAKHAND",
    "ANDAMAN AND NICOBAR ISLANDS",
    "TELANGANA",
    "PUDUCHERRY",
    "LAKSHADWEEP",
    "DAMAN AND DIU",
    "DADRA AND NAGAR"
  ];
  var postpaidOperator = [
    "Airtel",
    "Airtel Postpaid (Fetch & Pay)",
    "BSNL Mobile",
    "Idea",
    "Reliance Jio",
    "Tata Docomo CDMA Mobile Postpaid",
    "Tata Docomo GSM Mobile Postpaid",
    "Vodafone",
    "Vodafone Postpaid (Fetch & Pay)"
  ];
  var postpaidCircle = [
    "Andhra Pradesh",
    "Assam",
    "Bihar",
    "Chennai",
    "Delhi",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Karnataka",
    "Kerala",
    "Kolkata",
    "Maharashtra",
    "Madhya Pradesh",
    "Mumbai",
    "North East",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Tamil Nadu",
    "Uttar Pradesh - East",
    "Uttar Pradesh - West",
    "West Bengal",
    "Jharkhand",
    "TRIPURA",
    "ARUNACHAL PRADESH",
    "CHHATTISGARH",
    "GOA",
    "MANIPUR",
    "MEGHALAYA",
    "MIZORAM",
    "NAGALAND",
    "SIKKIM",
    "UTTAR PRADESH",
    "UTTARAKHAND",
    "ANDAMAN AND NICOBAR ISLANDS",
    "TELANGANA",
    "PUDUCHERRY",
    "LAKSHADWEEP",
    "DAMAN AND DIU",
    "DADRA AND NAGAR"
  ];

  var dthProvider = [
    "Airtel Digital TV",
    "Dish TV",
    "Sun Direct",
    "Tata Sky",
    "Tata Sky - ONLINE",
    "Videocon DTH"
  ];

  var bbpsService = [
    "Broadband Postpaid",
    "Cable TV",
    "CHALLAN",
    "DTH",
    "Education Fees",
    "Electricity",
    "Fastag",
    "GAS",
    "Gas Cylinder",
    "GIFTCARD",
    "Health Insurance",
    "Hospital",
    "Housing Society",
    "Insurance",
    "Landline Postpaid",
    "Life Insurance",
    "Loan Repayment",
    "METRO TRAIN",
    "Mobile Postpaid",
    "Money Transfer",
    "Municipal Services",
    "Municipal Taxes",
    "Pan Card",
    "Postpaid-Mobile",
    "Prepaid-Mobile",
    "Subscription Fees",
    "Water"
  ];

  var month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  var filter = ["Failed", "Successful"];

  var history = [
    {
      "transferStatus": "Received from",
      "name": "Surojit Polley",
      "money": "Rs 10,000",
      "time": "1 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
    {
      "transferStatus": "Received from",
      "name": "Sourav Mondal",
      "money": "Rs 5,000",
      "time": "2 days ago",
      "payStatus": "credited to",
      "image": "images/ico_home_selected.png"
    },
    {
      "transferStatus": "Paid to",
      "name": "Surojit Polley",
      "money": "Rs 100",
      "time": "3 days ago",
      "payStatus": "Failed",
      "image": "images/ico_history_selected.png"
    },
    {
      "transferStatus": "Received from",
      "name": "Surojit Polley",
      "money": "Rs 10,000",
      "time": "4 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
    {
      "transferStatus": "Payment to",
      "name": "Surojit Polley",
      "money": "Rs 9,000",
      "time": "5 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
    {
      "transferStatus": "Received from",
      "name": "Surojit Polley",
      "money": "Rs 10,000",
      "time": "6 days ago",
      "payStatus": "Failed",
      "image": "images/ico_history_selected.png"
    },
    {
      "transferStatus": "Paid to",
      "name": "Sourav Mondal",
      "money": "Rs 500",
      "time": "7 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
    {
      "transferStatus": "paid to",
      "name": "Madhumita Das",
      "money": "Rs 999",
      "time": "7 days ago",
      "payStatus": "Failed",
      "image": "images/ico_history_selected.png"
    },
    {
      "transferStatus": "Received from",
      "name": "Surojit Polley",
      "money": "Rs 1,000",
      "time": "8 days ago",
      "payStatus": "Failed",
      "image": "images/ico_history_selected.png"
    },
    {
      "transferStatus": "Payment to",
      "name": "Avijit Sarkar",
      "money": "Rs 10,000",
      "time": "9 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
    {
      "transferStatus": "Received from",
      "name": "Surojit Polley",
      "money": "Rs 10",
      "time": "9 days ago",
      "payStatus": "credited to",
      "image": "images/ico_profile_selected.png"
    },
  ];
}
