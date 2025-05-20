const axios = require('axios');
const { format, subDays } = require('date-fns');
const fs = require('fs-extra');

async function generateTimeReport() {
  const apiKey = process.env.WAKATIME_API_KEY;
  if (!apiKey) {
    console.error('Error: WAKATIME_API_KEY environment variable is not set');
    process.exit(1);
  }
  
  // Calculate date range (last 7 days)
  const endDate = format(new Date(), 'yyyy-MM-dd');
  const startDate = format(subDays(new Date(), 7), 'yyyy-MM-dd');
  
  console.log(`Generating time report from ${startDate} to ${endDate}`);
  
  try {
    // Make API request to WakaTime
    const response = await axios.get(
      `https://wakatime.com/api/v1/users/current/summaries?start=${startDate}&end=${endDate}`,
      {
        headers: {
          Authorization: `Basic ${Buffer.from(apiKey).toString('base64')}`
        }
      }
    );
    
    // Ensure directory exists
    await fs.ensureDir('./time-reports');
    
    // Generate report filename
    const reportFileName = `./time-reports/time-report-${startDate}-to-${endDate}.json`;
    
    // Write report to file
    await fs.writeJson(reportFileName, response.data, { spaces: 2 });
    
    console.log(`✅ Time report saved to ${reportFileName}`);
  } catch (error) {
    console.error('Error generating time report:', error.message);
    if (error.response) {
      console.error('API response:', error.response.data);
    }
    process.exit(1);
  }
}

generateTimeReport();
