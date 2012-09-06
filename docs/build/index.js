var jade = require('jade')
  , fs = require('fs')
  , path = require('path')
  , pagesPath = __dirname + '/../templates/pages'
  , pageFile, pageStr, filename


fs.readdirSync(pagesPath)
  .forEach(function(name) {
    if (!name.match(/\.jade$/)) { return; }
    pageFile = path.join(pagesPath, name);
    pageStr = jade.compile(
      fs.readFileSync(pageFile, 'utf-8'), {
        filename: pageFile
      })();

    filename = name.replace(/jade$/, 'html');
    fs.writeFileSync(__dirname + '/../' + filename, pageStr, 'utf-8')
    console.info('  \033[90m%s \033[37m%s', 'compiled', filename);
  });
