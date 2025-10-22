const puppeteer = require('puppeteer');

(async function printPDF() {
  // Script parameter: language
  var language = "en"
  var arg_language = process.argv.find( element => element.startsWith("language=") ) 
  if (arg_language)
  {
    language = arg_language.replace("language=", "")
  }
  else
  {
    console.log(`No language provided, language set to '${language}' by default`)
  }

  // Script parameter: url
  var url = `https://wasta-geek.github.io/curriculum-vitae/${language}`
  var arg_url = process.argv.find( element => element.startsWith("url=") ) 
  if (arg_language && arg_url)
  {
    url = arg_url.replace("url=", "")
  }
  else
  {
    console.log(`No url provided, url set to '${url}' by default`)
  }

  // Script parameter: pdf output folder
  var output_folder = "/home"
  var arg_output_folder = process.argv.find( element => element.startsWith("output_folder=") ) 
  if (arg_output_folder)
  {
    output_folder = arg_output_folder.replace("output_folder=", "")
  }
  else
  {
    console.log(`No output folder provided, output folder set to '${output_folder}' by default`)
  }

  // Variables related to browser
  const pdf_path = `${output_folder}/${ language }.pdf`
  const browser = await puppeteer.launch({
    headless: true,
    args:['--no-sandbox'] });
  
  const page = await browser.newPage();
  
  // Browser to url
  await page.goto(`${ url }`, { waitUntil: 'networkidle0' }).catch(async function (error) {
    console.log(error)
    await browser.close();
    process.exit(1)
  });
  page.setExtraHTTPHeaders({
    'Accept-Charset': 'utf-8',
    'Content-Type': 'text/html; charset=utf-8',
  })

  // Generate PDF
  const pdf = await page.pdf(
    {
      path: pdf_path,
      format: 'A4',
      printBackground: true,
      preferCSSPageSize: false
    });

  await browser.close();
  console.log(`Your pdf was successfully created at path: ${ pdf_path }`)
  return pdf
})();