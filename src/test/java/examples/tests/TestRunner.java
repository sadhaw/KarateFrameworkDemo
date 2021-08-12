package examples.tests;

// import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunner {
 
    @Test
   void testParallel() {
        
        Results results = Runner.path("classpath:examples/tests").tags("~@ignore")
        .outputCucumberJson(true)
        .parallel(1);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
       
    }

public static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
    List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "demo");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
}

 /*   @Karate.Test
    Karate demoFeature() {
        return Karate.run("uiAutomation").relativeTo(getClass());
        }
        @Karate.Test
        Karate demoDatabase() {
            return Karate.run("dbConnect").relativeTo(getClass());
            } 
 */

/* public class KarateTestSuite {
	@Karate.Test
	Karate testAll() {
		return Karate.run().relativeTo(this.getClass());
	}
} */

// @Karate.Test
// Karate dataFile() {
//     return Karate.run("dataFile").relativeTo(getClass());
// }
/* public class TestRunner {
    @Karate.Test
    Karate demoAll() {
        return Karate.run("classpath:com/karate/tags.feature);
} */

}