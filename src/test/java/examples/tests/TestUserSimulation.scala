package examples.tests

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
import scala.language.postfixOps

class TestUserSimulation extends Simulation {

  before {
    println("Tasklist Management Load Tests are about to start!!")
  }
  val rampUsersCount: Int = Properties.propOrElse("rampUsers", "10").toInt
  val rampDuration: Int = Properties.propOrElse("rampDuration", "5").toInt
  
    val getUser = scenario("getCall").exec(karateFeature("classpath:examples/tests/CURD.feature"))

    setUp(
      // getUser.inject(rampUsers(10) during (5 seconds)))
      getUser.inject(rampUsers(rampUsersCount) during rampDuration)
    )

    after {
    println("Tasklist Management Load Tests finished!!")
  }
}
