var jade = require('jade')
  , fs = require('fs')
  , tmplDir = __dirname + '/../templates/'
  , layout, pages;

layout = jade.compile(
  fs.readFileSync(tmplDir + 'layout.jade', 'utf-8'));

fs.readdirSync(tmplDir + '/pages')
  .forEach(function(name) {
    if (!name.match(/\.jade$/)) { return; }

    var page = layout({
      body: jade.compile(fs.readFileSync(
        tmplDir + 'pages/' + name, 'utf-8'))()
    }),

    filename = name.replace(/jade$/, 'html');
    fs.writeFileSync(__dirname + '/../' + filename, page, 'utf-8')
    console.info('  \033[90m%s \033[37m%s', 'compiled', filename);
  });
