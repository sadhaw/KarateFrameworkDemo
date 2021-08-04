function fn() { 
  
    var config = {
     name : "test123",
     baseURL : "https://parabank.parasoft.com/",
    //input_username : "//input[@type='text']"
    usr : "Sunny",
    pwd : "Rainbow123",
    txtWelcome : "Accounts Overview",
    drpAcntType : 2,
    drpAcntNmbr : 2,
    txtNewAcnt : "Account Opened!",
    txtTrnfrFnds : "Transfer Funds",
    nmbrAmnt : "100",
    drpFrmAcnt : 3,
    drpToAcnt : 2,
    txtTrnfrCmplt : "Transfer Complete!",
    } 
  
    var env = karate.env
    karate.log('Env is : ',env )
  
    if(env == 'firefox'){
        karate.configure('driver', { type: 'geckodriver' })
    }
  
    else if(env == 'edge'){
        karate.configure('driver', { type: 'msedge' })
    }
  
    else{
        karate.configure('driver', { type: 'chrome' })
    }
  
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
  
    return config;
   }