var jade = require('jade'),
  fs = require('fs'),
  tmplDir = __dirname + '/../templates/',
  layout, pages;

layout = jade.compile(
  fs.readFileSync(
    tmplDir + 'layout.jade', 'utf-8'));

fs.readdirSync(tmplDir + '/pages')
  .forEach(function(name) {
    if (!name.match(/\.jade$/)) { return; }

    var page = layout({
      body: jade.compile(fs.readFileSync(
        tmplDir + 'pages/' + name, 'utf-8'))()
    });

    fs.writeFileSync(__dirname + '/../'
      + name.replace(/jade$/, 'html'), page, 'utf-8')
  });
