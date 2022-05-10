const puppeteer = require('puppeteer')
const path = require("path");

(async function printPDF() {
  var language = "en"
  var arg_language = process.argv.find( element => element.startsWith("language=") ) 
  if (arg_language)
  {
    language = arg_language.replace("language=", "")
  }
  else
  {
    console.log("No language provided, language set to 'en' by default")
  }

  const pdf_path = `/home/${ language }.pdf`
  const browser = await puppeteer.launch({ headless: true });
  const htmlFile = path.resolve(`./home/_site/${ language }/index.html`);
  const page = await browser.newPage();
  await page.goto("file://" + htmlFile, { waitUntil: 'networkidle0' }).catch(async function (error) {
    console.log(error)
    await browser.close();
    process.exit(1)
  });
  page.setExtraHTTPHeaders({
    'Accept-Charset': 'utf-8',
    'Content-Type': 'text/html; charset=utf-8',
  })
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
})()