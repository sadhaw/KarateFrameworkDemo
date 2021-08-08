package examples.tests;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
         //return Karate.run("users").relativeTo(getClass());
       return Karate.run("calc").relativeTo(getClass());
    }    

}
